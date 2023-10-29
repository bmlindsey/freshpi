#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script with sudo."
   exit 1
fi