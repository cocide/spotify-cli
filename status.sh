#!/bin/bash
source creds.sh
status=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$access_token)
volume=$(echo $status | jq ".device.volume_percent")
playing=$(echo $status | jq ".is_playing")
