#!/bin/sh

KEYSTORE_FILE="/usr/local/tomcat/conf/keystore.jks"

if [ ! -f "$KEYSTORE_FILE" ]; then
    echo "Keystore not found. Generating a new one..."

    keytool -genkey -alias tomcat -keyalg RSA \
        -keystore "$KEYSTORE_FILE" \
        -storepass changeit -keypass changeit \
        -validity 365 \
        -dname "CN=localhost, OU=zeroday.cloud, O=zeroday.cloud, L=zeroday.cloud, S=zeroday.cloud, C=zeroday.cloud"
else
    echo "Keystore already exists. Skipping generation."
fi

exec catalina.sh run
