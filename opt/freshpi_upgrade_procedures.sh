#!/bin/bash

# Startup notification
startupNotification() {
    info "Time to Cook: Beginning updates at $(date +"$DATE_FORMAT")!"
}

# Completion notification
completionNotification() {
    success "Baked Fresh: Upgrades completed at $(date +"$DATE_FORMAT")!"
}

# Update package lists
updatePackageLists() {
    info "Updating package lists"
    if apt-get update; then
        success "Successfully updated package lists"
    else
        failure "Failed to update package lists"
        exit 1
    fi
}

# Upgrade installed packages
upgradeInstalledPackages() {
    info "Upgrading installed packages"
    if apt-get -y -q upgrade; then
        success "Successfully upgraded installed packages "
    else
        failure "Failed to upgrade installed packages"
        exit 1
    fi
}

# Remove unnecessary packages
removeUnnecessaryPackages() {
    info "Removing unnecessary packages"
    if apt-get -y -q autoremove; then
        success "Successfully removed unnecessary packages"
    else
        failure "Failed to removed unnecessary packages"
        exit 1
    fi
}
