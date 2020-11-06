#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "data": {
      "key": "'"${KEY}"'",
      "value": "'"${VALUE}"'"
    }
  }'

echo

# TOKEN=34372c6721f2bfa612564dcf3eb19cb1 ID=5fa5ccb0e864eb0017250830 KEY="name" VALUE="hiC" sh curl-scripts-heroku/item/update.sh
