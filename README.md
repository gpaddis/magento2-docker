# Magento2: Docker setup
This repository automates the setup described in this tutorial by Shawn Abramson, with a few updates: https://www.magemodule.com/all-things-magento/magento-2-tutorials/docker-magento-2-development/

You will be asked for your Magento credentials - you can save them globally on your system after the first installation.

## Commands
* Build and start the container: `docker-compose up -d --build`
* Spawn a shell in the container: `docker exec -it web bash`
* Stop the container: `docker-compose stop`

## Resources
* Docker image (web): https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache-dev.html#docker-image-tags
