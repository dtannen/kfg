# Contributing to kfg

Thank you for your interest in contributing to kfg! We welcome contributions from the community.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/kfg.git`
3. Create a new branch for your feature: `git checkout -b feature-name`

## Development Setup

### Requirements
- macOS with Terminal.app
- Python 3.6+
- Basic understanding of AppleScript and Unix domain sockets

### Installation
```bash
./install.sh
```

## Making Changes

### Code Style
- Follow existing code patterns and conventions
- Keep functions focused and well-documented
- Use clear, descriptive variable names

### Testing
- Test your changes thoroughly on macOS Terminal.app
- Verify daemon functionality (start, stop, status)
- Test socket communication between client and daemon
- Ensure proper cleanup of temporary files

### Key Areas to Test
- Terminal window selection and control
- Socket communication (`~/.kfg_socket`)
- Daemon lifecycle management (`~/.kfg_pid`)
- State persistence (`~/.kfg_state`)
- AppleScript integration

## Submitting Changes

1. Commit your changes with clear, descriptive messages
2. Push to your fork: `git push origin feature-name`
3. Open a Pull Request with:
   - Clear description of changes
   - Why the change is needed
   - How it was tested

## Pull Request Guidelines

- Keep PRs focused on a single feature or fix
- Include relevant test cases or verification steps
- Update documentation if needed
- Ensure backwards compatibility when possible

## Reporting Issues

When reporting bugs, include:
- macOS version
- Terminal.app version
- Steps to reproduce
- Expected vs actual behavior
- Relevant log output

## Feature Requests

For new features:
- Describe the use case
- Explain how it fits with the existing functionality
- Consider backwards compatibility

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help newcomers learn and contribute

## Questions?

Feel free to open an issue for questions about contributing or development setup.