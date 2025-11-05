#!/bin/sh
if [ "${CONTAINER_ROLE}" = "init" ]; then
  CLI_BIN=${CLI_BIN:-/bin/cli}
  $CLI_BIN migrate up "$@"
elif [ "${CONTAINER_ROLE}" = "worker" ]; then
  WORKER_BIN=${WORKER_BIN:-/bin/worker}
  dlv exec "$WORKER_BIN" --wd=/ --headless --listen=:2345 --accept-multiclient --continue  "$@"
else
  MAIN_BIN=${MAIN_BIN:-/bin/main}
  dlv exec "$MAIN_BIN" --wd=/ --headless --listen=:2345 --accept-multiclient --continue  "$@"
fi
