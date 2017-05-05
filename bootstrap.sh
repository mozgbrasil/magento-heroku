#!/bin/bash

#

# bash -x bootstrap.sh

#

# https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/

#printenv

#

REGEX_EXPR='postgres:\/\/(.+):(.+)@(.+)(:5432| )\/(.+)'
#$DATABASE_URL # PostgreSQL

REGEX_EXPR='mysql:\/\/(.+):(.+)@(.+)(:3306| )\/(.+)'
#$JAWSDB_URL # MySQL

if [[ $JAWSDB_URL =~ $REGEX_EXPR ]]
then
    #echo The regex matches!
    #echo $BASH_REMATCH      
    #echo ${BASH_REMATCH[1]} 
    #echo ${BASH_REMATCH[2]}
    #echo ${BASH_REMATCH[3]} 
    #echo ${BASH_REMATCH[4]} 
    #echo ${BASH_REMATCH[5]}

    MAGENTO_DB_HOST=${BASH_REMATCH[3]}
    MAGENTO_DB_PORT=${BASH_REMATCH[4]}
    MAGENTO_DB_NAME=${BASH_REMATCH[5]}
    MAGENTO_DB_USER=${BASH_REMATCH[1]}
    MAGENTO_DB_PASS=${BASH_REMATCH[2]}

    #echo "${MAGENTO_URL}"
    #echo "${MAGENTO_DB_HOST}"
    #echo "${MAGENTO_DB_PORT}"
    #echo "${MAGENTO_DB_NAME}"
    #echo "${MAGENTO_DB_USER}"
    #echo "${MAGENTO_DB_PASS}"
else
    echo "Unable to parse STRING from config"
fi

#

echo -e "--(Start)--" ;\

#

WICH_7ZA=`which 7za`
WICH_TAR=`which tar`

echo $WICH_7ZA
echo $WICH_TAR

#

cd root

echo -e "--(`pwd`)--" ;\

# Sample Data

echo -e "--(Sample Data)--" ;\

echo -e "--(Processo 1)--" ;\

wget https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/1.9.1.0/compressed-no-mp3-magento-sample-data-1.9.1.0.tar.7z ;\

echo -e "--(Processo 2)--" ;\

7za x compressed-no-mp3-magento-sample-data-1.9.1.0.tar.7z ;\

echo -e "--(Processo 3)--" ;\

tar -xvf compressed-no-mp3-magento-sample-data-1.9.1.0.tar ;\

echo -e "--(Processo 4)--" ;\

cp -fri magento-sample-data-1.9.1.0/media/* media/ ;\

echo -e "--(Processo 5)--" ;\

mysql -h "${MAGENTO_DB_HOST}${MAGENTO_DB_PORT}" -u ${MAGENTO_DB_USER} -p${MAGENTO_DB_PASS} ${MAGENTO_DB_NAME} < 'magento-sample-data-1.9.1.0/magento_sample_data_for_1.9.1.0.sql' ;\

echo -e "--(Processo 6)--" ;\

rm -fr compressed-no-mp3-magento-sample-data-1.9.1.0.tar compressed-no-mp3-magento-sample-data-1.9.1.0.tar.7z magento-sample-data-1.9.1.0

# Check Database

echo -e "--(Check Database)--" ;\

mysql -h "${MAGENTO_DB_HOST}${MAGENTO_DB_PORT}" -u ${MAGENTO_DB_USER} -p${MAGENTO_DB_PASS} ${MAGENTO_DB_NAME} -Nse "SHOW TABLES"

#

exec $@