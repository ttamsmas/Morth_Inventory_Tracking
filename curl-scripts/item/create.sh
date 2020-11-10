#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "department": "'"${DEPARTMENT}"'",
      "quantity": "'"${QUANTITY}"'",
      "cost": "'"${COST}"'"
    }
  }'

echo

# TOKEN=b054dcbd5c77ed48a688be991607f91f NAME=2 DEPARTMENT=2 QUANTITY=2 COST=2 sh curl-scripts/item/create.sh
