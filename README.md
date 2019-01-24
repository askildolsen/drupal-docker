# Drupal-Docker boilerplate

## Installation

docker-compose up -d --build\
docker-compose run drush si standard --db-url=pgsql://postgres:example@postgres/postgres

## Upgrade

docker-compose down\
docker volume rm drupal-docker_drupal\
docker-compose build --pull\
docker-compose up -d

## Uninstall

docker-compose down\
(docker volume prune)
