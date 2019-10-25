# Magento2: Docker setup
This repository automates the setup described in this tutorial by Shawn Abramson, with a few updates: https://www.magemodule.com/all-things-magento/magento-2-tutorials/docker-magento-2-development/

You will be asked for your Magento credentials in order to download the Magento repository and install all dependencies. You can save them globally on your system after the first installation.

To start, clone this repository anywhere on your disk and run the script `install-magento.sh`.

## Commands
* Build and start the container: `./start`
* Spawn a shell in the container: `./shell`
* Stop the container: `./stop`

## Addresses
* MariaDB: 127.0.0.1:3307
* PHPMyAdmin: 127.0.0.1:8080

## Troubleshooting
* Check that you don't have other running containers using the ports 80, 3307 and 8080 with `docker ps`. In case you do, stop them.
* You might have to stop services on your host system (e.g. Apache or MySQL) to make the ports available.

## Resources
* Docker image (web): https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache-dev.html#docker-image-tags
