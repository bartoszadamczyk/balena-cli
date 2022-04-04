#!/bin/bash
set -e

if [ -d "${APPLICATION_PATH}" ]; then
  cd "${APPLICATION_PATH}"
else
  cd "/app"
fi

if [[ "${BALENA_API_TOKEN}" == "" ]]; then
  echo "Error: Please set the environment variable BALENA_API_TOKEN with a Balena API token"
  exit 1
fi

balena login --token "${BALENA_API_TOKEN}" > /dev/null

# Don't use "$*" it won't work with spaces nicely
balena $*
