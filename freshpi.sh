#!/bin/bash

# Update package lists
apt-get update

# Upgrade installed packages
apt-get -y -q upgrade

# Remove unnecessary packages
apt-get -y -q autoremove