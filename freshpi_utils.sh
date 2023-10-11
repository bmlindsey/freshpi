# Setup basic environment
setup() {
    # Ensure log directory exists
    mkdir -p "$LOG_DIR"

    # Redirect output
    exec 3>&1
    exec 1>>"$LOG_PATH"
    exec 2>&1
}

# Display an information message
info() {
    echo -e "[i] $1" | tee /dev/fd/3
}

# Display a success message
success() {
    echo -e "[\u2713] $1" | tee /dev/fd/3
}

# Display a failure message
failure() {
    echo -e "[x] $1" | tee /dev/fd/3
}