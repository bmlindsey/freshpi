#!/bin/bash

source "/etc/freshpi/config.conf"
source "/opt/freshpi/freshpi_utils.sh"
source "/opt/freshpi/freshpi_upgrade_procedures.sh"
source "/opt/freshpi/freshpi_log_rotation.sh"

# Check for root privileges
checkForRoot

# Ensure log directory exists
ensureLogDirExists

# Setup environment
setupLogStreams

# Display help/usage information
display_help() {
    {
        echo "Usage: $(basename $0) [options]"
        echo "Options:"
        echo "  (no args)      Update your Raspberry Pi"
        echo "  --rotate-logs  Rotate the logs."
        echo "  --help         Display this help message."
    } >&3
    exit 1
}

# Check arguments
if [[ "$1" == "--help" ]]; then
    display_help
elif [[ "$1" == "--rotate-logs" ]]; then
    log_rotation
else
    startupNotification
    updatePackageLists
    upgradeInstalledPackages
    removeUnnecessaryPackages
    cleanLocalRepository
    completionNotification
fi
