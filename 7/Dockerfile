# Drupal Commerce Docker Container
FROM php:7-fpm
MAINTAINER Matt Glaman <nmd.matt@gmail.com>

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini && \
  echo "date.timezone=America/Chicago" > $PHP_INI_DIR/conf.d/date_timezone.ini && \
  echo "sendmail_path=/bin/true" > $PHP_INI_DIR/conf.d/sendmail.ini

# Packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  libbz2-dev \
  php-pear \
  curl \
  git \
  unzip \
  && docker-php-ext-install mcrypt zip bz2 bcmath pdo_mysql mysqli mbstring opcache \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd

# Environmental Variables
ENV COMPOSER_HOME /root/composer

# Add global binary directory to path
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set up the application directory
WORKDIR /app

ENV PHP_SERVER "127.0.0.1:8080"
ENV PHP_DOCROOT "/app"
ENV SIMPLETEST_DB "sqlite://localhost//tmp/site.sqlite"
ENV SIMPLETEST_BASE_URL "http://127.0.0.1:8080"
ENV SIMPLETEST_GROUP "--all"
ENV SIMPLETEST_SCRIPT "/app/core/scripts/run-tests.sh"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
