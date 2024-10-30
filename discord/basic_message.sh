#!/bin/bash

# Default values for optional arguments
DEFAULT_MESSAGE="Hello from an OCC Server! This is the default message."
DEFAULT_USERNAME="ServerBot"
DEFAULT_AVATAR_URL="https://i.imgur.com/4M34hi2.png"

# Check if the webhook URL is provided
if [ -z "$1" ]; then
  echo "Error: Webhook URL must be provided as the first argument."
  exit 1
fi

# Assign provided values or fall back to defaults
WEBHOOK_URL="$1"
MESSAGE="${2:-$DEFAULT_MESSAGE}"
USERNAME="${3:-$DEFAULT_USERNAME}"
AVATAR_URL="${4:-$DEFAULT_AVATAR_URL}"

# Send the message
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{
           \"username\": \"$USERNAME\",
           \"avatar_url\": \"$AVATAR_URL\",
           \"content\": \"$MESSAGE\"
         }" \
     "$WEBHOOK_URL"
