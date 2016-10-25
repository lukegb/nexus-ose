#!/bin/bash
# https://github.com/sonatype/nexus-book-examples/tree/nexus-3.0.x/scripting/simple-shell-example

jsonFile=$1

printf "Creating Integration API Script from $jsonFile\n\n"

curl -v -u "$(cat /etc/probe-secrets/username):$(cat /etc/probe-secrets/password)" --header "Content-Type: application/json" "${NEXUS_BASE_URL}/service/siesta/rest/v1/script/" -d @$jsonFile
