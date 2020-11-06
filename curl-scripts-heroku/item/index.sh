#!/bin/sh

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=077064f173dbde25c19a5e0fc41a90e8 sh curl-scripts-heroku/item/index.sh
