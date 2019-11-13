#/usr/bin/env bash

set -eou pipefail

if [[ -z "$DIGITALOCEAN_TOKEN" ]]
then
    echo "$DIGITALOCEAN_TOKEN is empty. Please provide it."
    exit 1
fi

curl -X GET \
-s \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
"https://api.digitalocean.com/v2/account/keys" | jq ".ssh_keys[].id"
