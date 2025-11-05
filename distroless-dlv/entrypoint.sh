#!/bin/sh
if [ "${CONTAINER_ROLE}" = "init" ]; then
  /bin/cli migrate up "$@"
elif [ "${CONTAINER_ROLE}" = "worker" ]; then
  dlv exec /bin/worker --wd=/ --headless --listen=:2345 --api-version=2 --accept-multiclient --continue "$@"
else
  dlv exec /bin/main --wd=/ --headless --listen=:2345 --api-version=2 --accept-multiclient --continue "$@"
fi
