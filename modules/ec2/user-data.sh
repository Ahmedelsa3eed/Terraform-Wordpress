#!/bin/bash

# Clone repo that contains the docker-compose file
git clone -b update-db-host https://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@github.com/Ahmedelsa3eed/wordpress-docker.git
cd wordpress-docker/
docker compose up --build