#!/bin/bash

source "/etc/freshpi/config.conf"
source "/opt/freshpi/freshpi_utils.sh"

# Archive the current log file
archive_current_log() {
    local archive_filename="${LOG_PATH}.$(date +${LOG_DATE_FORMAT})"
    mv "${LOG_PATH}" "${archive_filename}"
    gzip "${archive_filename}"
}

# Count the number of log files that exist
count_logs() {
    local log_count=$(
        find "${LOG_DIR}" \
            -type f \
            -name "${LOG_FILE}.*.gz" | \
        wc -l
    )
    echo "${log_count}"
}

# Purge old logs greater than the number of MAX_LOG_FILES
purge_old_logs() {
    local log_count=$(count_logs)
    local logs_to_delete=$((log_count - MAX_LOG_FILES))

    if (( logs_to_delete > 0 )); then
        find "${LOG_DIR}" -type f -name "${LOG_FILE}.*.gz" | \
        sort | \
        head -n "${logs_to_delete}" | \
        xargs rm -f
    fi
}

# Full log rotation
log_rotation () {
    if file_exists "${LOG_PATH}"; then
        archive_current_log
    else
        echo "${LOG_FILE} does not exist"
    fi
    purge_old_logs
}