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

# TOKEN=d53c6ce593487d54a1de9a656304caae ID=5fa5ccb0e864eb0017250830 KEY="name" VALUE="hiC" sh curl-scripts-heroku/item/update.sh
