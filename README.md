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
