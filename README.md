# Remind-Me

This bash script that allows you to set timed reminders directly from your terminal.

## Overview

`reminder.sh` is a lightweight alternative to complex calendar or reminder applications. It lets you quickly set up notifications for future events without leaving your command line.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/remind-me.git
   cd remind-me
   ```

2. Make the script executable:
   ```bash
   chmod +x reminder.sh
   ```

3. Optionally, add it to your PATH for system-wide access:
   ```bash
   sudo cp reminder.sh /usr/local/bin/remind-me
   ```

## Usage

```bash
./reminder.sh <time> <message>
```

### Examples

```bash
# Set a reminder for 3:30 PM
./reminder.sh 15:30 "Call the dentist"

```

## Features

- Simple, intuitive command-line interface
- Runs in the background without blocking your terminal
- Cross-platform notifications (Linux, macOS, and fallback for other systems)
- Displays human-readable wait time when setting a reminder

## System Support

- **Linux**: Uses `notify-send` for desktop notifications
- **macOS**: Uses `osascript` for native notifications
- **Other systems**: Falls back to terminal output with bell sound

## Requirements

- Bash shell
- For Linux: `notify-send` (usually included in `libnotify-bin` package)
- For macOS: No additional requirements (uses built-in `osascript`)

## License

[MIT License](LICENSE)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
