#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/examples"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "example": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
