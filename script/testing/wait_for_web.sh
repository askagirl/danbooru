#!/bin/sh

set -e

host="$1"
shift
cmd="$@"

until docker exec danbooru_web_1 curl -I -s http://$host ; do
  echo "Danbooru web is unavailable - sleeping"
  sleep 3
done

>&2 echo "Danbooru web is up - executing command"
exec $cmd
