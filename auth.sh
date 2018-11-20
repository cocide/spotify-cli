#!/bin/bash
source creds.sh
echo 'go to https://accounts.spotify.com/en/authorize?response_type=code&redirect_uri=https:%2F%2Flocalhost/&client_id=c9e41772f39149b2bd6535db63f284b5&scope=user-modify-playback-state%20user-read-playback-state'
echo 'from that URL get the code, and set it in the creds.sh file using the creds.sh.example as a template'
echo 'press enter when ready'
read

rawcreds=$(curl -H 'Authorization: Basic YzllNDE3NzJmMzkxNDliMmJkNjUzNWRiNjNmMjg0YjU6YzIzMjk4YmJmMzM4NGFiMGIyOTZhOTE1NjZhZjFhMDM=' -d 'grant_type=authorization_code' -d 'code='$access_code -d 'redirect_uri=https://localhost/' https://accounts.spotify.com/api/token)
access_token=$(echo $rawcreds | jq ".access_token")
refresh_token=$(echo $rawcreds | jq ".refresh_token")

echo '#!/bin/bash
access_code="'$access_code'"
access_token='$access_token'
refresh_token="'$refresh_token'"' > creds.sh
