#!/bin/bash -e

if [[ "$1" == "start" ]]; then
  # start sql-relay service
  echo "start sql-relay..."
  sqlr-start "$@"
else
  # exec other command,for example a `bash` shell to explore this image
  exec "$@"
fi
