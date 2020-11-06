#!/bin/bash

API="https://morthinventorytracking.herokuapp.com"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=7509bd790700b81141c0cb73f0f591fb sh curl-scripts-heroku/auth/sign-out.sh
