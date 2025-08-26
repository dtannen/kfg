# kfg - Keep Fucking Going!

A terminal utility that automatically continues Claude Code sessions when Claude stops working on tasks.

## How it works

1. In your Claude Code project directory, run `kfg add` to set up the hook
2. Start `kfg` - it shows you a list of terminal windows to choose from
3. Select your Claude Code terminal window - `kfg` runs as a daemon and listens for hook triggers
4. When triggered by the Claude Code hook, `kfg` reads your last Claude response and:
   - If Claude responded "Y": sends "enter" + "keep fucking going!" + "enter" sequence
   - If Claude responded "N": does nothing
   - Otherwise: asks "Is there anything you can continue working on? (Y/N)"

## Installation

```bash
./install.sh
```

This installs `kfg` to `/usr/local/bin/` so you can run it from anywhere.

## Usage

### Start the daemon
```bash
kfg
```
- Lists all terminal windows
- Select one by number
- Daemon starts and listens for triggers

### Send triggers
```bash
kfg trigger          # Send trigger to daemon
./kfg-client         # Alternative client script
```

### Read terminal output
```bash
kfg last-line        # Get the last line from selected terminal
```

### Claude Integration
```bash
kfg add             # Add kfg hook to Claude settings
```

**Note**: For Claude to access all tools properly, run Claude with `--dangerously-skip-permissions` flag.

### Configuration
```bash
kfg config                           # Show current configuration
kfg config set continue_phrase "go!" # Set custom continue phrase
kfg config set polite_question "Continue?" # Set custom question
kfg config set delays.initial 1.0   # Set initial delay in seconds
```

### Management
```bash
kfg status          # Check if daemon is running
kfg stop            # Stop the daemon
kfg help            # Show help
```

## Use cases

- **Primary use case**: Automatically continue Claude Code sessions when Claude stops working on multi-step tasks
- **Manual triggering**: Use `kfg trigger` to manually prompt Claude to continue
- **Terminal monitoring**: Use `kfg last-line` to check Claude's last response

## Files created

- `~/.kfg_socket` - Unix domain socket for communication
- `~/.kfg_pid` - PID file for daemon management
- `~/.kfg_state` - Stores selected terminal window index
- `~/.kfg_config.json` - Configuration file for custom phrases and delays

## Requirements

- macOS with Terminal.app
- Python 3.6+

## Technical details

- Uses AppleScript to control Terminal.app windows
- Unix domain socket for fast local IPC
- Daemon process with proper cleanup
- Signal handling for graceful shutdown
- Configurable phrases and timing delays
- Improved Y/N response detection with regex patterns
- Better error handling and input validation

## License

MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.