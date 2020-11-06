#!/bin/sh

API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=7e47d8d619a59fd3a5f5c11da443294f sh curl-scripts/items/index.sh
