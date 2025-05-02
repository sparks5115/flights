#!
read -p "Enter departure airport code (e.g., BOS): " ORIGIN_LOCATION_CODE

RESPONSE=$(curl "https://test.api.amadeus.com/v1/security/oauth2/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=n0L8cSLrSQnkVnHOlq5mVI14LUe6wItL&client_secret=jY88sGW5aNc48lh6")
token=$(echo "$RESPONSE" | jq -r '.access_token')
echo $token

curl "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=${ORIGIN_LOCATION_CODE}&maxPrice=200" \
      -H "Authorization: Bearer ${token}" | jq '.data'
