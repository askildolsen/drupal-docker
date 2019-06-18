# Drupal-Docker boilerplate

## Installation

docker-compose up -d --build\
docker-compose run --rm drupal vendor/bin/drush site:install standard --db-url=pgsql://postgres:example@postgres/postgres\
docker-compose run --rm drupal vendor/bin/drush config:import --partial

### Adminimal theme

docker-compose run --rm drupal vendor/bin/drush theme:enable adminimal_theme\
docker-compose run --rm drupal vendor/bin/drush config:set system.theme default adminimal_theme\
docker-compose run --rm drupal vendor/bin/drush config:set system.theme admin adminimal_theme

## Upgrade

docker-compose down\
docker volume rm drupal-docker_drupal\
docker-compose build --pull\
docker-compose up -d\
docker-compose run -rm drupal vendor/bin/drush cr

## Uninstall

docker-compose down\
(docker volume prune)
