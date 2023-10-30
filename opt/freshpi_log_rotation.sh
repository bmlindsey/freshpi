#!/bin/bash

source "/etc/freshpi/config.conf"
source "/opt/freshpi/freshpi_utils.sh"

file_exists () {
    local file_path="$1"
    if [[ -f "${file_path}" ]]; then
        return 0
    else
        return 1
    fi
}

archive_current_log() {
    local archive_filename="${LOG_PATH}.$(date +${LOG_DATE_FORMAT})"
    mv "${LOG_PATH}" "${archive_filename}"
    gzip "${archive_filename}"
}

count_logs() {
    local log_count=$(
        find "${LOG_DIR}" \
            -type f \
            -name "${LOG_FILE}.*.gz" | \
        wc -l
    )
    echo "${log_count}"
}

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

log_rotation () {
    if file_exists "${LOG_PATH}"; then
        archive_current_log
    else
        echo "${LOG_FILE} does not exist"
    fi
    purge_old_logs
}