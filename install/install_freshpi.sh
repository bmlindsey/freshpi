#!/bin/bash

# Define version and variables
VERSION="0.2.0"
RELEASE_URL="https://github.com/bmlindsey/freshpi/archive/refs/tags/v${VERSION}.tar.gz"
TEMP_INSTALL_DIR="/tmp/freshpi-install"
FRESHPI_BIN="/usr/local/bin"
FRESHPI_VARS="/etc/freshpi"
FRESHPI_UTILS="/opt/freshpi"
FRESHPI_DOCS="/usr/share/doc/freshpi"

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Ensure the directories exist before copying files over
mkdir -p $FRESHPI_VARS
mkdir -p $FRESHPI_UTILS
mkdir -p $FRESHPI_DOCS

# Download and extract the release archive to TEMP_INSTALL_DIR
mkdir -p $TEMP_INSTALL_DIR
wget -O "$TEMP_INSTALL_DIR/freshpi-$VERSION.tar.gz" $RELEASE_URL
tar -xzf "$TEMP_INSTALL_DIR/freshpi-$VERSION.tar.gz" -C $TEMP_INSTALL_DIR

# Copy files to appropriate locations
cp $TEMP_INSTALL_DIR/freshpi-$VERSION/bin/* $FRESHPI_BIN
cp $TEMP_INSTALL_DIR/freshpi-$VERSION/etc/* $FRESHPI_VARS
cp $TEMP_INSTALL_DIR/freshpi-$VERSION/opt/* $FRESHPI_UTILS

# Make the scripts executable
chmod +x $FRESHPI_BIN/freshpi.sh

# Save the README and License to FRESHPI_DOCS
cp $TEMP_INSTALL_DIR/freshpi-$VERSION/README.md $FRESHPI_DOCS
cp $TEMP_INSTALL_DIR/freshpi-$VERSION/LICENSE $FRESHPI_DOCS

# Clean up the TEMP_INSTALL_DIR
rm -rf $TEMP_INSTALL_DIR

echo "FreshPi v$VERSION installed successfully!"
