#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "item": {
      "name": "'"${NAME}"'"
    }
  }'

echo

# TOKEN=984abdb92da933652016e96bc763450e ID=5fa46dc191c0c64f62de2131 NAME="hiC" sh curl-scripts/item/update.sh
