#!/bin/bash

FRESHPI_VARS_DIR="/etc/freshpi"
FRESHPI_UTILS_DIR="/opt/freshpi"
FRESHPI_BIN_DIR="/usr/local/bin"

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script with sudo."
   exit 1
fi

# Create directories if they don't exist
mkdir -p "${FRESHPI_VARS_DIR}"
mkdir -p "${FRESHPI_UTILS_DIR}"

# Download files from the GitHub repository
echo "Downloading FreshPi files..."
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/freshpi.sh" -O "${FRESHPI_BIN_DIR}/freshpi.sh"
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/freshpi_log_rotation.sh" -O "${FRESHPI_UTILS_DIR}/freshpi_log_rotation.sh"
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/freshpi_utils.sh" -O "${FRESHPI_UTILS_DIR}/freshpi_utils.sh"
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/LICENSE" -O "${FRESHPI_UTILS_DIR}/LICENSE"
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/README.md" -O "${FRESHPI_UTILS_DIR}/README.md"
wget -q "https://raw.githubusercontent.com/bmlindsey/freshpi/main/config.conf" -O "${FRESHPI_VARS_DIR}/config.conf"

# Set permissions
chmod +x "${FRESHPI_BIN_DIR}/freshpi.sh"
chmod +x "${FRESHPI_UTILS_DIR}/freshpi_log_rotation.sh"

# Provide feedback to the user
echo "FreshPi has been successfully installed!"
