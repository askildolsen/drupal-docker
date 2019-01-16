# Drupal-Docker boilerplate

## Installation

docker-compose up -d --build\
docker-compose run drush si standard --db-url=pgsql://postgres:example@postgres/postgres

## Upgrade

docker-compose down\
docker volume rm drupal-docker_drupal

## Uninstall

docker-compose down\
(docker volume prune)
