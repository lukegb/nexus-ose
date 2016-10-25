#!/usr/bin/env bash

if [ -z "$NEXUS_BASE_URL" ]
then
   export NEXUS_BASE_URL="http://localhost:8081"
fi

HEALTH_CHECK_URL=${NEXUS_BASE_URL}/service/metrics/healthcheck
RESPONSE=$(wget -qO- --user "$(cat /etc/probe-secrets/username)" --password "$(cat /etc/probe-secrets/password)" --auth-no-challenge --no-cache --tries=1 --timeout=1 $HEALTH_CHECK_URL | jq '.deadlocks.healthy' | grep true)
if [ "$RESPONSE" ] ; then
    echo "--> readiness is Alive"
    exit 0;
else
    echo "--> readiness is Dead"
    exit 1;
fi
