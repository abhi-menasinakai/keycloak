#!/bin/sh
set -e
echo "Running custom setup tasks..."
# Custom setup commands can go here
#echo "Running build to apply configuration changes..."
/opt/keycloak/bin/kc.sh build
echo "Starting Keycloak server with verbose logging..."

# Start Keycloak with verbose logging options and output logs to CLI
exec /opt/keycloak/bin/kc.sh start \
    --hostname auth.konectar.io \
    --spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true
    --optimized
