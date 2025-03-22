#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <hh:mm> <text message>"
    exit 1
fi

time_to_seconds() {
    IFS=: read -r hour minute <<< "$1"
    echo $(( 10#$hour * 3600 + 10#$minute * 60 ))
}

current_time_seconds() {
    current_time=$(date +"%H:%M")
    time_to_seconds "$current_time"
}

time_arg="$1"
message="${*:2}"

current_seconds=$(current_time_seconds)
target_seconds=$(time_to_seconds "$time_arg")

if [ $target_seconds -le $current_seconds ]; then
    echo "Invalid time: Time is in the past."
    exit 3
fi

diff_seconds=$((target_seconds - current_seconds))

if [ "$REMINDER_CLI" = "1" ]; then
    sleep $diff_seconds
    
    if command -v notify-send &> /dev/null; then
         notify-send "Reminder" "$message"
    elif command -v osascript &> /dev/null; then
        osascript -e "display notification \"$message\" with title \"Reminder\""
    else
        echo -e "\a\nREMINDER: $message\n"
    fi
else
    export REMINDER_CLI=1
    nohup "$0" "$@" > /dev/null 2>&1 &
    
    if [ $diff_seconds -ge 3600 ]; then
        hours=$((diff_seconds / 3600))
        minutes=$(((diff_seconds % 3600) / 60))
        echo "Reminder will be displayed after ${hours}h ${minutes}m"
    else
        minutes=$((diff_seconds / 60))
        seconds=$((diff_seconds % 60))
        echo "Reminder will be displayed after ${minutes}m ${seconds}s"
    fi
    exit 0
fi
