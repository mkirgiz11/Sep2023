#!/bin/bash

response=$(curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DO_TOKEN" \
  -d '{"name":"created-via-script","region":"nyc3","size":"s-1vcpu-1gb","image":"ubuntu-20-04-x64"}' \
  "https://api.digitalocean.com/v2/droplets" | jq)

droplet_name=$(echo "$response" | jq -r '.droplet.name')
droplet_region=$(echo "$response" | jq -r '.droplet.region.slug')
droplet_size=$(echo "$response" | jq -r '.droplet.size_slug')
droplet_image=$(echo "$response" | jq -r '.droplet.image.slug')

echo "Created a droplet with the name $droplet_name, in $droplet_region, with $droplet_size size, that uses $droplet_image."

