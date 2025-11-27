#!/bin/bash
LOGFILE=~/SysOpsLab/system_status.log
mkdir -p ~/SysOpsLab
{
    echo "=============================="
    echo "Timestamp: $(date '+%d-%m-%Y %H:%M:%S')"
    echo "---- System Uptime ----"
    uptime

    echo "---- CPU Load Average ----"
    awk '{print "1 min: "$1", 5 min: "$2", 15 min: "$3}' /proc/loadavg

    echo "---- Memory Usage ----"
    free -h

    echo "---- Disk Space Utilization ----"
    df -h /

    echo "=============================="
    echo
} >> "$LOGFILE"
