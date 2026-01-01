#!/bin/bash

# Read the status content
status="$(systemctl status mariadb.service | grep "running")"

# Compare status and act accordingly
if [[ "$status" == '' ]]; then
    systemctl start mariadb.service
    mariadb --password
else
    mariadb --password
fi

