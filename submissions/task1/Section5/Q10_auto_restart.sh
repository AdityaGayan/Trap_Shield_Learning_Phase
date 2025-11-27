#!/bin/bash
SERVICE="NetworkManager"

STATUS=$(systemctl is-active "$SERVICE")

if [[ "$STATUS" != "active" ]]; then
    echo "$(date): $SERVICE is $STATUS. Restarting..."
    sudo systemctl restart "$SERVICE"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$(date): $SERVICE restarted successfully."
    else
        echo "$(date): Failed to restart $SERVICE."
    fi
else
    echo "$(date): $SERVICE is running normally."
fi
