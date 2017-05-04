#!/bin/bash

#

#

# https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/

printenv
printenv >> mozg_log.txt

#

#$(composer config -a http-basic.repo.magento.com ${MAGENTO_USERNAME} ${MAGENTO_PASSWORD})
#$(composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition vendor/magento)

#

MAGENTO_URL=`heroku info --app magento-heroku -s | grep web_url | cut -d= -f2`

QUERY_STRING=`heroku config:get JAWSDB_URL --app magento-heroku | cat $1 | sed -E 's%mysql:\/\/(.*)(.*):(.*)@(.*)(:\d+|.*)(.*)\/%user=\1;password=\3;host=\4;db=\2%'`

eval `echo "${QUERY_STRING}"|tr '&' ';'`

MAGENTO_DB_HOST=${host}
MAGENTO_DB_NAME=${db}
MAGENTO_DB_USER=${user}
MAGENTO_DB_PASS=${password}

echo ${HEROKU_APP}
echo "${MAGENTO_URL}"
echo "${MAGENTO_DB_HOST}"
echo "${MAGENTO_DB_NAME}"
echo "${MAGENTO_DB_USER}"
echo "${MAGENTO_DB_PASS}"

#if [[ "${JAWSDB_URL}" =~ PATTERN ]]; then
#  dbUser=${BASH_REMATCH[2]}
#  dbPass=${BASH_REMATCH[3]}
#  dbHost=${BASH_REMATCH[4]}
#  dbName=${BASH_REMATCH[5]}
#else
#  echo "Unable to parse JAWSDB_URL from config"
#fi

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