#!/bin/sh

CERT_KEY="/etc/nginx/certs/nginx.key"
CERT_FILE="/etc/nginx/certs/nginx.crt"

if [ ! -f "$CERT_KEY" ] || [ ! -f "$CERT_FILE" ]; then
  echo ">>> Generating self-signed SSL certificate for localhost..."
  
  mkdir -p /etc/nginx/certs

  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$CERT_KEY" \
    -out "$CERT_FILE" \
    -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/CN=localhost"
  
  echo ">>> SSL certificate generated!"
else
  echo ">>> SSL certificate already exists, skipping generation."
fi

exec nginx -g 'daemon off;'

