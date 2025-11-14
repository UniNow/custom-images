#!/bin/sh
if [ "${CONTAINER_ROLE}" = "init" ]; then
  INIT_CMD=${INIT_CMD:-"/bin/cli migrate up"}
  $INIT_CMD "$@"
elif [ "${CONTAINER_ROLE}" = "worker" ]; then
  WORKER_CMD=${WORKER_CMD:-/bin/worker}
  dlv exec "$WORKER_CMD" --wd=/ --headless --listen=:2345 --accept-multiclient --continue  "$@"
else
  MAIN_CMD=${MAIN_CMD:-/bin/main}
  dlv exec "$MAIN_CMD" --wd=/ --headless --listen=:2345 --accept-multiclient --continue  "$@"
fi
