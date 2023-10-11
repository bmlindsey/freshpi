#!/bin/bash

source config.conf
source freshpi_utils.sh

# Ensure log directory exists
mkdir -p "$LOG_DIR"

exec >> "$LOG_PATH" 2>&1

# Update package lists
info "Updating package lists"
apt-get update

# Upgrade installed packages
info "Upgrading installed packages"
apt-get -y -q upgrade

# Remove unnecessary packages
info "Removing unnecessary packages"
apt-get -y -q autoremove