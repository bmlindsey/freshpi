#!/bin/bash

source config.conf

rename_current_log() {
    mv "${LOG_PATH}" "${LOG_PATH}.$(date +${LOG_DATE_FORMAT})"
}

rename_current_log