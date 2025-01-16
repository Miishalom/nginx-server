#!/bin/bash

# shellcheck disable=SC2034
SCRIPT_DIR=$(dirname "$0")

docker-compose -f "$SCRIPT_DIR/docker-compose.yml" up certbot-renew