#!/bin/sh

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=d53c6ce593487d54a1de9a656304caae sh curl-scripts-heroku/item/index.sh
