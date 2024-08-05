#!/bin/sh
set -e

echo "Running custom setup tasks..."
# Custom setup commands can go here

echo "Running build to apply configuration changes..."
/opt/keycloak/bin/kc.sh build

echo "Starting Keycloak server..."
exec /opt/keycloak/bin/kc.sh start-dev

