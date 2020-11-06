#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/change-password"

curl "${API}${URL_PATH}/" \
  --include \
  --request PATCH \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo

# TOKEN=7e47d8d619a59fd3a5f5c11da443294f OLDPW=2 NEWPW=3 sh curl-scripts-heroku/auth/change-password.sh
