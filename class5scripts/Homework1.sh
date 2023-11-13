#!/bin/bash

DROPLET_ID=$(curl -s http://169.254.169.254/metadata/v1/id)

response=$(curl -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DO_TOKEN" \
  "https://api.digitalocean.com/v2/droplets/$DROPLET_ID")


error=$(echo "$response" | jq -r '.message')
if [ "$error" != "null" ]; then
    echo "Error: $error , Please check connection"
    exit 1
    ##if API repsponse gives an error, there is a problem connecting to API. Check connections and if Token is R&W and sourced. 
fi

for droplet in $(echo "$response" | jq -c '.droplet.networks.v4[]'); do
    ipv4=$(echo "$droplet" | jq -r '.ip_address')
    if [ "$ipv4" != "null" ]; then
        echo "Droplet IP: $ipv4"
        ##For loop to print if ipv4 is available, if not, print error
    else
        echo "Check if there are droplets. Could not find IP."
    fi
done






 