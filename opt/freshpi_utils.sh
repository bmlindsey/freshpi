# Setup basic environment
setupLogStreams() {
    # Redirect output
    exec 3>&1
    exec 1>>${LOG_PATH}
    exec 2>&1
}

# Check for root privileges
checkForRoot() {
    if [[ $EUID -ne 0 ]]; then
        echo "ERROR: Please run this script with sudo."
        exit 1
    fi
}

# Display an information message
info() {
    echo -e "[${INFO_COLOR}i${RESET}] $1" | tee /dev/fd/3
}

# Display a success message
success() {
    echo -e "[${SUCCESS_COLOR}\u2713${RESET}] $1" | tee /dev/fd/3
}

# Display a failure message
failure() {
    echo -e "[${FAILURE_COLOR}x${RESET}] $1" | tee /dev/fd/3
}

# Display a warning message
warning() {
    echo -e "[${WARNING_COLOR}w${RESET}] $1" | tee /dev/fd/3
}