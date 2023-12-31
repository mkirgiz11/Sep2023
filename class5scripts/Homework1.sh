#!/bin/bash

droplets=$(curl -s -H "Authorization: Bearer $DO_TOKEN" \
"https://api.digitalocean.com/v2/droplets" | jq -r '.droplets[].id')
#API CALL to Digital ocean


#for loop To get droplet id's
for DROPLET_ID in $droplets; do
    response=$(curl -s -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DO_TOKEN" \
      "https://api.digitalocean.com/v2/droplets/$DROPLET_ID")

    ##To see if there are errors in API connection.
    error=$(echo "$response" | jq -r '.message')
    if [ "$error" != "null" ]; then
        echo "Error for Droplet $DROPLET_ID: $error, Please check connection"
        ##if API repsponse gives an error, there is a problem connecting to API. Check connections and if Token is R&W and sourced. 
        exit 1
    else
        droplet_status=$(echo "$response" | jq -r '.droplet.status')
        ## If condition to see if it is active, to print IP address, if it cant for any reason, error message.
        if [ "$droplet_status" == "active" ]; then
            for droplet in $(echo "$response" | jq -c '.droplet.networks.v4[]'); do
                ipv4=$(echo "$droplet" | jq -r '.ip_address')
                if [ "$ipv4" != "null" ]; then
                    echo "Droplet $DROPLET_ID IP: $ipv4"
                else
                    echo "Droplet $DROPLET_ID: Check if there are droplets. There seems to be a problem. Could not find IP."
                fi
            done
        else
            echo "Droplet $DROPLET_ID is inactive."
            ## Else print out that droplet is inactive.
        fi
    fi
done





 