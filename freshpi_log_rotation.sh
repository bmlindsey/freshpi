#!/bin/bash

source config.conf

archive_current_log() {
    local archive_filename="${LOG_PATH}.$(date +${LOG_DATE_FORMAT})"
    mv "${LOG_PATH}" "${archive_filename}"
    gzip "${archive_filename}"
}

file_exists () {
    local file_path="$1"
    if [[ -f "${file_path}" ]]; then
        return 0
    else
        return 1
    fi
}

log_rotation () {
    if file_exists "${LOG_PATH}"; then
        archive_current_log
    else
        echo "${LOG_FILE} does not exist"
    fi
}

log_rotation