php bin/magento setup:install \
--admin-firstname=John \
--admin-lastname=Doe \
--admin-email=johndoe@example.com \
--admin-user=admin \
--admin-password='admin123' \
--base-url=https://local.domain.com \
--base-url-secure=https://local.domain.com \
--backend-frontname=admin \
--db-host=mysql \
--db-name=magento \
--db-user=root \
--db-password=root \
--use-rewrites=1 \
--language=en_US \
--currency=EUR \
--timezone=Europe/Berlin \
--use-secure-admin=1 \
--admin-use-security-key=1 \
--session-save=files \
--use-sample-data

echo "Setup complete! Shop URL: https://local.domain.com."