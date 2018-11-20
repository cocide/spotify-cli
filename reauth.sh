#!/bin/bash
source creds.sh
access_token=$(curl -H 'Authorization: Basic YzllNDE3NzJmMzkxNDliMmJkNjUzNWRiNjNmMjg0YjU6YzIzMjk4YmJmMzM4NGFiMGIyOTZhOTE1NjZhZjFhMDM=' -d 'grant_type=refresh_token' -d 'refresh_token='$refresh_token -d 'redirect_uri=https://localhost/' https://accounts.spotify.com/api/token | jq ".access_token")

echo '#!/bin/bash
access_code="'$access_code'"
access_token='$access_token'
refresh_token="'$refresh_token'"' > creds.sh
