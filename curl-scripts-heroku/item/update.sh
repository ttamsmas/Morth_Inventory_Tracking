#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
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

# TOKEN=077064f173dbde25c19a5e0fc41a90e8 ID=5fa5ccb0e864eb0017250830 NAME="hiC" sh curl-scripts-heroku/item/update.sh
