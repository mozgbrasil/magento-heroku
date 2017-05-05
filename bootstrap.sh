#!/bin/bash

#

# bash -x bootstrap.sh

#

# https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/

printenv

#

MAGENTO_URL="$1"

REGEX_EXPR='postgres:\/\/(.+):(.+)@(.+)(:5432| )\/(.+)'
#$DATABASE_URL # PostgreSQL

REGEX_EXPR='mysql:\/\/(.+):(.+)@(.+)(:3306| )\/(.+)'
#$JAWSDB_URL # MySQL

if [[ $JAWSDB_URL =~ $REGEX_EXPR ]]
then
    echo The regex matches!
    echo $BASH_REMATCH      
    echo ${BASH_REMATCH[1]} 
    echo ${BASH_REMATCH[2]}
    echo ${BASH_REMATCH[3]} 
    echo ${BASH_REMATCH[4]} 
    echo ${BASH_REMATCH[5]}

    MAGENTO_DB_HOST=${BASH_REMATCH[3]}
    MAGENTO_DB_PORT=${BASH_REMATCH[4]}
    MAGENTO_DB_NAME=${BASH_REMATCH[5]}
    MAGENTO_DB_USER=${BASH_REMATCH[1]}
    MAGENTO_DB_PASS=${BASH_REMATCH[2]}

    echo "${MAGENTO_URL}"
    echo "${MAGENTO_DB_HOST}"
    echo "${MAGENTO_DB_PORT}"
    echo "${MAGENTO_DB_NAME}"
    echo "${MAGENTO_DB_USER}"
    echo "${MAGENTO_DB_PASS}"
else
    echo "Unable to parse STRING from config"
fi

#

php -f root/install.php -- \
--license_agreement_accepted "yes" \
--locale "pt_BR" \
--timezone "America/Sao_Paulo" \
--default_currency "BRL" \
--db_host "${MAGENTO_DB_HOST}${MAGENTO_DB_PORT}" \
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

#

echo 'Fim'

#

exec $@