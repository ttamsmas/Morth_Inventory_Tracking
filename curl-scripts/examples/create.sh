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
      "cost": "'"${COST}"'",
      "price": "'"${PRICE}"'",
      "owner": "'"${OWNER}"'"
    }
  }'

echo

# TOKEN=7e47d8d619a59fd3a5f5c11da443294f NAME=Spindrift DEPARTMENT=Drinks QUANTITY=12 COST=5 PRICE=10 OWNER=5fa4562e0c18e64cb5af2bb6 sh curl-scripts/items/create.sh
