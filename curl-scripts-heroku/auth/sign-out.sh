#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=b03f75fcfc9c18d347c858c497dfa789 sh curl-scripts-heroku/auth/sign-out.sh
