#!/bin/bash
source reauth.sh
source status.sh

curl -X "POST" "https://api.spotify.com/v1/me/player/previous" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$access_token
