#!/bin/bash

source "/etc/freshpi/config.conf"
source "/opt/freshpi/freshpi_utils.sh"
source "/opt/freshpi/freshpi_upgrade_procedures.sh"

# Check for root privileges
checkForRoot

# Ensure log directory exists
ensureLogDirExists

# Setup environment
setupLogStreams

# Run upgrades
startupNotification
updatePackageLists
upgradeInstalledPackages
removeUnnecessaryPackages
cleanLocalRepository
completionNotification