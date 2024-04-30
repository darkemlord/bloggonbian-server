#!/bin/bash

if [ "$RAILS_ENV" == "production" ]; then
  echo "This script should not be run in the production environment."
  exit 1
fi

# Exec commands to create and initialize db
if ! docker-compose exec -T bloggonbian bash -c "rails db:drop && rails db:create && rails db:migrate && rails db:seed"; then
  echo "Error: The operation could not be completed. Make sure the container is running and accessible."
  exit 1
fi

echo "The database has been successfully reset in the container."
