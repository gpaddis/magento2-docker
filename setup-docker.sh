#!/bin/bash
# By default, the shop will be available under https://${projectname}.local when the setup is complete.

set -e

projectName="$1"
domainName="${projectName}.local"

if [[ $# -ne 1 ]]; then
echo "Usage: $0 project-name"
    exit 1
fi

# Detect OS
case `uname -s` in
    Darwin) is_macos=yes ;;
    *) is_macos=no ;;
esac

searchAndReplace() {
    local original="$1"
    local replacement="$2"
    local file="$3"
    if [ "$is_macos" = no ]; then
        sed -i "s%${original}%${replacement}%g" $file
    elif [ "$is_macos" = yes ]; then
        sed -i '' "s%${original}%${replacement}%g" $file
    fi
}

if [ ! -d "$projectName" ]; then
    echo "$projectName" >> .gitignore
    composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition $projectName

    # Increase memory limits
    find $projectName -name '.htaccess' -exec sed -i '' s/756M/2048M/g {} + && \
    find $projectName -name '.htaccess' -exec sed -i '' s/768M/2048M/g {} + && \
    find $projectName -name '.user.ini' -exec sed -i '' s/756M/2048M/g {} + && \
    find $projectName -name '.user.ini' -exec sed -i '' s/768M/2048M/g {} +
fi

searchAndReplace "/path/to/magento" "${PWD}/${projectName}" docker-compose.yml
searchAndReplace "custom" "${projectName}" docker-compose.yml
searchAndReplace "local.domain.com" "${domainName}" docker-compose.yml
searchAndReplace "custom" "${projectName}" shell

if [ -f "install-magento.sh" ]; then
    searchAndReplace "local.domain.com" "${domainName}" install-magento.sh
    chmod +x install-magento.sh
    mv install-magento.sh ${projectName}/.
fi

echo "Adding ${domainName} to /etc/hosts..."
echo "please enter your password:"
sudo -- sh -c "echo '127.0.0.1 ${domainName}' >> /etc/hosts"

docker-compose up -d --build

echo "The docker container was set up correctly."
echo "To install magento, open a shell in the container and run the script install-magento.sh in the app/ directory."

# Remove git and the current script.
rm -rf .git
rm $0