#!/bin/sh

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=5033c9420ba52e9fbff0c01ea5b557f1 sh curl-scripts-heroku/item/index.sh
