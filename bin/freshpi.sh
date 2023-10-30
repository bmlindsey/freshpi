#!/bin/bash

FRESHPI_VARS_DIR="/etc/freshpi"
FRESHPI_UTILS_DIR="/opt/freshpi"

source "${FRESHPI_VARS_DIR}/config.conf"
source "${FRESHPI_UTILS_DIR}/freshpi_utils.sh"
source "${FRESHPI_UTILS_DIR}/freshpi_upgrade_procedures.sh"

# Check for root privileges
checkForRoot

# Ensure log directory exists
mkdir -p ${LOG_DIR}

# Setup environment
setupLogStreams

# Run upgrades
startupNotification
updatePackageLists
upgradeInstalledPackages
removeUnnecessaryPackages
completionNotification