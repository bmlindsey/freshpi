#!/bin/bash

source config.conf

rename_current_log() {
    mv "${LOG_PATH}" "${LOG_PATH}.$(date +${LOG_DATE_FORMAT})"
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
        rename_current_log
    else
        echo "${LOG_FILE} does not exist"
    fi
}

log_rotation