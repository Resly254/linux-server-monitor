# Linux Server Health Monitor

## Overview
A Bash-based monitoring tool that checks basic Linux system
health and network connectivity.

## Features
- Reports hostname and system uptime.
- Monitors root filesystem disk usage.
- Reports memory utilization.
- Checks network reachability using ping.
- Warns when disk or memory usage reaches 80%.
- Saves timestamped results to a log file.

## Requirements
- Linux (tested on Ubuntu)
- Bash
- Standard Linux utilities: df, free, awk, ping

## How to Run

```bash
chmod +x server_monitor.sh
./server_monitor.sh
```

## View Logs

```bash
cat logs/health.log
```

## Skills Demonstrated
- Linux command-line administration
- Bash scripting and functions
- Networking fundamentals
- Log management
- Git version control

## Limitations
This is a beginner monitoring tool, not a replacement for
production monitoring platforms. Network checks depend on
ICMP reachability, and resource thresholds are configurable.

## Future Improvements
- Automated scheduling with cron
- Configurable alert thresholds
- CPU usage measurement
- Email or other alert notifications