Drupal Simpletest Docker Image
===============================

Easily run Simpletest locally with this Docker image.

````sh
docker build 7 -t simpletest-php7
docker run -it --rm simpletest-php7 -v /path/to/drupal:/app

docker build 5.6 -t simpletest-php5.6
docker run -it --rm simpletest-php5.6bec -v /path/to/drupal:/app
````

If using the `drupal-composer/drupal-project` or `drupalcommerce/project-base`

````sh
docker run -it --rm -v $(pwd):/app --env SIMPLETEST_SCRIPT="/app/web/core/scripts/run-tests.sh" --env PHP_DOCROOT="/app/web" simpletest-php7
````
