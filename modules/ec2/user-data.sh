#!/bin/bash

# Clone repo that contains the docker-compose file
git clone https://github.com/Ahmedelsa3eed/wordpress-docker.git
cd wordpress-docker/
docker compose up --build