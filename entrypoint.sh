#!/usr/bin/env bash
php -S ${PHP_SERVER} -t ${PHP_DOCROOT} > /dev/null 2>&1 &

sleep 2

curl -I ${SIMPLETEST_BASE_URL}

echo "php ${SIMPLETEST_SCRIPT} --concurrency 5 --url ${SIMPLETEST_BASE_URL} --dburl ${SIMPLETEST_DB} --sqlite /dev/shm/tmp.sqlite --color ${SIMPLETEST_GROUP} | tee simpletest.log"
php ${SIMPLETEST_SCRIPT} --concurrency 5 --url ${SIMPLETEST_BASE_URL} --dburl ${SIMPLETEST_DB} --sqlite /tmp/tmp.sqlite --color ${SIMPLETEST_GROUP} | tee simpletest.log
