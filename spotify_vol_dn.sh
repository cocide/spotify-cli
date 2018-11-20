#!/bin/bash
source reauth.sh
source status.sh

volume=$(expr $volume - 2)
curl -X "PUT" "https://api.spotify.com/v1/me/player/volume?volume_percent="$volume -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$access_token
