# About

This repository contains artifacts for building a Sickgear Docker Image on Alpine Linux.

It is kept as minimal as possible and uses volumes.

- Built from Official Alpine Docker Image

Published to Dockerhub.

## Usage

To run the docker container ensure your run command has the required volumes you want. E.g.,

`docker run -it -v /datahost-sickgear:/data -v /tvhost:/tv -p 8081:8081 timm088/sickgear:1.0`

- You can add existing data and configuration files to the /datahost-xx folder locally, or let the app build new ones on first launch.

## History

- 22-06-17: First release, alpine 3.6
- 09-06-18: Bump to alpine 3.7