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

QUERY_STRING=`heroku config:get JAWSDB_URL --app magento-heroku | cat $1 | sed -E 's%mysql:\/\/(.*)(.*):(.*)@(.*)(:\d+|.*)(.*)\/%user=\1;password=\3;host=\4;db=\2%'`

eval `echo "${QUERY_STRING}"|tr '&' ';'`

dbHost=${host}
dbName=${db}
dbUser=${user}
dbPass=${password}

echo "${dbHost}"
echo "${dbName}"
echo "${dbUser}"
echo "${dbPass}"

#if [[ "${JAWSDB_URL}" =~ PATTERN ]]; then
#  dbUser=${BASH_REMATCH[2]}
#  dbPass=${BASH_REMATCH[3]}
#  dbHost=${BASH_REMATCH[4]}
#  dbName=${BASH_REMATCH[5]}
#else
#  echo "Unable to parse JAWSDB_URL from config"
#fi

#

#--db_pass ${dbPass} \
#--url "http://127.0.0.1/public_html/magento-1.9.3.2-dev35/root/" \

php -f root/install.php -- \
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