#!/bin/bash

URL=${SITE_URL:-https://www.csd.uoc.gr}

echo "Downloading from: $URL"

wget -E -k -p -nH --cut-dirs=1 --no-check-certificate "$URL" -P /usr/share/nginx/html

echo "Download finished. Starting Nginx..."

nginx -g "daemon off;"