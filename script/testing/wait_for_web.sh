#!/bin/sh

set -e

host="$1"
shift
cmd="$@"

until curl -s http://$host ; do
  echo "Danbooru web is unavailable - sleeping"
  sleep 1
done

>&2 echo "Danbooru web is up - executing command"
exec $cmd
