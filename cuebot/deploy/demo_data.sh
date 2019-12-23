#!/bin/bash

#until nc --send-only db 5432 < /dev/null
#do
#    echo "Waiting for postgres container..."
#    sleep 2
#done
export
until psql -c "select 1"
do
    echo "Waiting for postgres to accept connections..."
    sleep 2
done

# Check if a show exists, if not apply demo data
if psql -c "select 1 from show"|grep "(0 rows)"; then
    psql -a -f /deploy/OpenCue-${OPENCUE_RELEASE}/cuebot/src/main/resources/conf/ddl/postgres/demo_data.sql
fi
