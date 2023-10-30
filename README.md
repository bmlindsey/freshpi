# FreshPi
**FreshPi** is a simple command line tool for Raspberry Pi maintenance. It keeps your Raspberry Pi up-to-date and includes built in logging.

## Features
- **System Updates:** Easily update software with a single command or schedule automated updates.
- **Logging:** Keep track of updates with built in logging.
- **Log Rotation:** Prevent your Raspberry Pi's storage from filling up by rotating log files automatically.

## Installation
**Warning**: Piping scripts directly into `bash` from the internet can be risky. Before proceeding, it's good practice to review scripts from sources you trust.

To review the installation script, you can visit [this link](https://raw.githubusercontent.com/bmlindsey/freshpi/main/install_freshpi.sh).

Once you've reviewed the script and feel confident in its contents, you can install FreshPi with the following command:

```bash
curl -sSL https://raw.githubusercontent.com/bmlindsey/freshpi/main/install_freshpi.sh | sudo bash
```

## Automated Updates
To automate the update process, you can schedule `freshpi.sh` to run as a task using `cron`. Here's how to set it up:

1. Open the root user's crontab with:
```bash
sudo crontab -e
```

2. Add the following line schedule updates to run every Saturday morning at midnight:
```bash
0 0 * * 6 /usr/local/bin/freshpi.sh
```

3. Add the following line to schedule log rotations once a year on at 11:59 PM on December 31st:
```bash
59 23 31 12 * /opt/freshpi/freshpi_log_rotation.sh
```