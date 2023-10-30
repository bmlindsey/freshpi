# FreshPi
**FreshPi** is a simple command line tool for Raspberry Pi maintenance.

## Features
- **Command Line Interface (CLI):** Options to upgrade packages, rotate logs, or display help.
- **System Updates:** Upgrade installed packages with a single command or schedule automated updates.
- **Logging:** Keep track of updates with built in logging.
- **Log Rotation:** Prevent your Raspberry Pi's storage from filling up by rotating log files.

## Installation
**Warning**: Piping scripts directly into `bash` from the internet can be risky. Before proceeding, it's good practice to review scripts from sources you trust.

To review the installation script, you can visit [this link](https://raw.githubusercontent.com/bmlindsey/freshpi/main/install/install_freshpi.sh)

Once you've reviewed the script and feel confident in its contents, you can install FreshPi with the following command:

```bash
curl -sSL https://raw.githubusercontent.com/bmlindsey/freshpi/main/install/install_freshpi.sh | sudo bash
```

## Usage
FreshPi provides a simple command line interface. Here's how to use it

### Display Help
```bash
freshpi.sh --help
```

### Upgrade Packages
```bash
sudo freshpi.sh
```

### Rotate Logs
```bash
sudo freshpi.sh --rotate-logs
```

Note: Make sure to use `sudo` as FreshPi requires root privileges to execute certain tasks.

## Automated Updates
To automate the update process, you can schedule `freshpi.sh` to run as a task using `cron`. Here's how to set it up:

1. Open the root user's crontab with:
```bash
sudo crontab -e
```

2. Add the following line to schedule updates to run every Saturday morning at midnight:
```bash
0 0 * * 6 /usr/local/bin/freshpi.sh
```

3. Add the following line to schedule log rotations once a year on at 11:59 PM on December 31st:
```bash
59 23 31 12 * /usr/local/bin/freshpi.sh --rotate-logs
```
