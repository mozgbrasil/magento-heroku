#!/bin/bash

#

# Copyright © 2017 Mozg. All rights reserved.
# See LICENSE.txt for license details.

#

# https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/

printenv

#

echo -e "--(Start)--" ;\

#

WICH_7ZA=`which 7za`
WICH_TAR=`which tar`
WICH_MYSQL=`which mysql`

echo -e "--( ${WICH_7ZA} )--" ;\
echo -e "--( ${WICH_TAR} )--" ;\
echo -e "--( ${WICH_MYSQL} )--" ;\

#

echo -e "--(`pwd`)--" ;\
echo -e "--(`ls -all`)--" ;\

#

curl --request POST https://fleep.io/hook/uIRi0JRt2yv5OQisX6tg --data 'teardown' --verbose

#