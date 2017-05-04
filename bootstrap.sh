#!/bin/bash

#$(composer config -a http-basic.repo.magento.com ${MAGENTO_USERNAME} ${MAGENTO_PASSWORD})
#$(composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition vendor/magento)

#

if [[ "${JAWSDB_URL}" =~ (mysql):\/\/([A-Za-z0-9]+):([A-Za-z0-9]+)@([^:]+):\d+\/(\w+) ]]
then
  dbUser=${BASH_REMATCH[2]}
  dbPass=${BASH_REMATCH[3]}
  dbHost=${BASH_REMATCH[4]}
  dbName=${BASH_REMATCH[5]}
else
  echo "Unable to parse JAWSDB_URL from config"
fi

#

php -f install.php -- \
--license_agreement_accepted "yes" \
--locale "pt_BR" \
--timezone "America/Sao_Paulo" \
--default_currency "BRL" \
--db_host ${dbHost} \
--db_name ${dbName} \
--db_user ${dbUser} \
--db_pass ${dbPass} \
--skip_url_validation "yes" \
--use_rewrites "yes" \
--use_secure "no" \
--secure_base_url "" \
--use_secure_admin "no" \
--admin_firstname "Magento" \
--admin_lastname "User" \
--admin_email "user@example.com" \
--admin_username "admin" \
--admin_password "123456a"