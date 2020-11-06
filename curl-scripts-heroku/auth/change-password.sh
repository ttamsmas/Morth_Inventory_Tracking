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

# TOKEN=b03f75fcfc9c18d347c858c497dfa789 OLDPW=3 NEWPW=2 sh curl-scripts-heroku/auth/change-password.sh
