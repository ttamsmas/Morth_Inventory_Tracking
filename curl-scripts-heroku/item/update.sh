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
      "key": "'"${KEY}"'",
      "value": "'"${VALUE}"'"
    }
  }'

echo

# TOKEN=5033c9420ba52e9fbff0c01ea5b557f1 ID=5fa5ccb0e864eb0017250830 KEY="name" VALUE="hiC" sh curl-scripts-heroku/item/update.sh
