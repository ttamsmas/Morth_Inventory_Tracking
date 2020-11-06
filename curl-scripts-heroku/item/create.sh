#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
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

# TOKEN=d53c6ce593487d54a1de9a656304caae NAME=Spindrift DEPARTMENT=Drinks QUANTITY=12 COST=5 PRICE=10 OWNER=5fa5cb5ee864eb001725082f sh curl-scripts-heroku/item/create.sh
