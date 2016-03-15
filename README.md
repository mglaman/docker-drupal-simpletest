Drupal Simpletest Docker Image
===============================

Easily run Simpletest locally with this Docker image.

````
docker build 7 -t simpletest-php7
docker run -it --rm simpletest-php7 -v /path/to/drupal:/app
````
