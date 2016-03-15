#!/usr/bin/env bash
php -S ${PHP_SERVER} -t /app > /dev/null 2>&1 &

sleep 2

curl -I ${SIMPLETEST_BASE_URL}

php /app/core/scripts/run-tests.sh \
    --concurrency 5 \
    --url ${SIMPLETEST_BASE_URL} \
    --dburl ${SIMPLETEST_DB} \
    --sqlite /tmp/tmp.sqlite \
    --color \
    ${SIMPLETEST_GROUP}
