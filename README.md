# Magento2: Docker setup
This repository automates the setup described in this tutorial by Shawn Abramson, with a few updates: https://www.magemodule.com/all-things-magento/magento-2-tutorials/docker-magento-2-development/

You will be asked for your Magento credentials in order to download the Magento repository and install all dependencies. You can save them globally on your system after the first installation.

To start, clone this repository in a directory and run the script `install-magento.sh`.

## Commands
* Build and start the container: `docker-compose up -d --build`
* Spawn a shell in the container: `docker exec -it web bash`
* Stop the container: `docker-compose stop`

## Addresses
* MariaDB: 127.0.0.1:3307
* PHPMyAdmin: 127.0.0.1:8080

## Troubleshooting
You might have to stop services on your host system (e.g. Apache or MySQL) to make the ports available.

## Resources
* Docker image (web): https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache-dev.html#docker-image-tags
