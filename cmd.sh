#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
    echo "Running develoment server"
    exec python "identidock.py"
else
    echo "Running production server"
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:919

fi