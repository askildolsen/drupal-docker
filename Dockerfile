FROM drupal:8-apache
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends git unzip

RUN composer require \
    'drupal/adminimal_theme' \
    'drupal/diff' \
    'drupal/entity_usage' \
    'drupal/geofield_map' \
    'drupal/leaflet' \
    'drupal/paragraphs' \
    'drupal/restui' \
    'drupal/webform' \
    'drupal/webform_rest'

WORKDIR /var/www/html/sites/default

RUN cp default.settings.php settings.php && \
    chmod 777 settings.php && \
    sed -i "$ a \$settings['file_private_path'] = '/var/www/private';" settings.php && \
    sed -i "$ a \$config_directories[CONFIG_SYNC_DIRECTORY] = '/var/www/sync';" settings.php && \
    mkdir files && \
    chmod 777 files && \
    mkdir /var/www/private && \
    chmod 777 /var/www/private && \
    mkdir /var/www/sync && \
    chmod 777 /var/www/sync
