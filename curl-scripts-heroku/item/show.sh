#!/bin/sh

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=7e47d8d619a59fd3a5f5c11da443294f ID=5fa46ee491c0c64f62de2132 sh curl-scripts-heroku/item/show.sh
