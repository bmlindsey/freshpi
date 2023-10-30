#!/bin/bash

FRESHPI_VARS_DIR="/etc/freshpi"
FRESHPI_UTILS_DIR="/opt/freshpi"

source "${FRESHPI_VARS_DIR}/config.conf"
source "${FRESHPI_UTILS_DIR}/freshpi_utils.sh"

# Check for root privileges
checkForRoot

# Setup environment
setupLogStreams

# Ensure log directory exists
mkdir -p ${LOG_DIR}

# Startup notification
info "Time to Cook: Beginning updates at $(date +"$DATE_FORMAT")!"

# Update package lists
info "Updating package lists"
if apt-get update; then
    success "Successfully updated package lists"
else
    failure "Failed to update package lists"
    exit 1
fi

# Upgrade installed packages
info "Upgrading installed packages"
if apt-get -y -q upgrade; then
    success "Successfully upgraded installed packages "
else
    failure "Failed to upgrade installed packages"
    exit 1
fi

# Remove unnecessary packages
info "Removing unnecessary packages"
if apt-get -y -q autoremove; then
    success "Successfully removed unnecessary packages"
else
    failure "Failed to removed unnecessary packages"
    exit 1
fi

# Completion notification
success "Baked Fresh: Updates completed at $(date +"$DATE_FORMAT")!"