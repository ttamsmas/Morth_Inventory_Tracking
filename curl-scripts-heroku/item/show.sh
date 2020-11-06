#!/bin/sh

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=5033c9420ba52e9fbff0c01ea5b557f1 ID=5fa5ccb0e864eb0017250830 sh curl-scripts-heroku/item/show.sh
