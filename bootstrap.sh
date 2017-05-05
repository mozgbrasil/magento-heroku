#!/bin/bash

#

# bash bootstrap.sh

#

# https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/

printenv
printenv >> mozg_log.txt

#

#$(composer config -a http-basic.repo.magento.com ${MAGENTO_USERNAME} ${MAGENTO_PASSWORD})
#$(composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition vendor/magento)

#

MAGENTO_URL=''

REGEX_EXPR='mysql:\/\/(.+):(.+)@(.+)(:3306| )\/(.+)'
$STRING=$JAWSDB_URL # MySQL

REGEX_EXPR='postgres:\/\/(.+):(.+)@(.+)(:5432| )\/(.+)'
$STRING=$DATABASE_URL # PostgreSQL

if [[ $STRING =~ $REGEX_EXPR ]]
then
    echo The regex matches!
    echo $BASH_REMATCH      
    echo ${BASH_REMATCH[1]} 
    echo ${BASH_REMATCH[2]}
    echo ${BASH_REMATCH[3]} 
    echo ${BASH_REMATCH[4]} 
    echo ${BASH_REMATCH[5]}

    MAGENTO_DB_HOST=${BASH_REMATCH[3]}
    MAGENTO_DB_NAME=${BASH_REMATCH[5]}
    MAGENTO_DB_USER=${BASH_REMATCH[1]}
    MAGENTO_DB_PASS=${BASH_REMATCH[2]}

    echo "${MAGENTO_URL}"
    echo "${MAGENTO_DB_HOST}"
    echo "${MAGENTO_DB_NAME}"
    echo "${MAGENTO_DB_USER}"
    echo "${MAGENTO_DB_PASS}"
else
    echo "Unable to parse JAWSDB_URL from config"
fi

#

php -f root/install.php -- \
--license_agreement_accepted "yes" \
--locale "pt_BR" \
--timezone "America/Sao_Paulo" \
--default_currency "BRL" \
--db_host ${MAGENTO_DB_HOST} \
--db_name ${MAGENTO_DB_NAME} \
--db_user ${MAGENTO_DB_USER} \
--db_pass ${MAGENTO_DB_PASS} \
--url $MAGENTO_URL \
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