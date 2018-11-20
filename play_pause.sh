#!/bin/bash
source reauth.sh
source status.sh

if [ $playing = "true" ]
  then
	curl -X "PUT" "https://api.spotify.com/v1/me/player/pause" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$access_token
  else
	curl -X "PUT" "https://api.spotify.com/v1/me/player/play" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer "$access_token
fi
