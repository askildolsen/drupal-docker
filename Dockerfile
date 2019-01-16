FROM drupal:8-apache
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends git unzip

RUN composer require \
    'drupal/bootstrap' \
    'drupal/diff' \
    'drupal/entity_usage' \
    'drupal/geofield_map' \
    'drupal/leaflet' \
    'drupal/paragraphs' \
    'drupal/webform'

WORKDIR /var/www/html/sites/default

RUN cp default.settings.php settings.php && \
    chmod 777 settings.php && \
    sed -i "$ a \$settings['file_private_path'] = '/var/www/private';" settings.php && \
    mkdir files && \
    chmod 777 files && \
    mkdir /var/www/private && \
    chmod 777 /var/www/private
