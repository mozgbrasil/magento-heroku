[checkmark]: https://raw.githubusercontent.com/mozgbrasil/mozgbrasil.github.io/master/assets/images/logos/Red_star_32_32.png "MOZG"
![valid XHTML][checkmark]

[getcomposer]: https://getcomposer.org/
[uninstall-mods]: https://getcomposer.org/doc/03-cli.md#remove

# Magento\Heroku

## Sinopse

Automação para criação de projeto Magento para o Heroku

## Descrição

Monte seu projeto Magento em apenas 1 clique, por apenas $10.00 que é o custo para uso do banco de dados na Heroku

## Implantando no Heroku

Clique abaixo para implantar esse APP na sua conta no Heroku

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Em seguida clique no botão "Deploy"

Ao finalizar a implantação do aplicativo será exibido a mensagem "Your app was successfully deployed."

Clique no botão "View"

Será carregado o aplicativo, com o acesso ao Magento 

## Comandos CLI

--

Install the Heroku CLI

Download and install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

--

cd ~/dados/public_html/mozg/git/magento-heroku

composer update --ignore-platform-reqs

--

# https://devcenter.heroku.com/articles/error-codes#h10-app-crashed

heroku logs --app magento-heroku --tail

--

heroku --version

heroku

heroku notifications

heroku --help

heroku list

heroku spaces

heroku status

heroku info --app magento-heroku

heroku drains --app magento-heroku

heroku pg --app magento-heroku

heroku releases --app magento-heroku

heroku config --app magento-heroku

heroku run --app magento-heroku ' pwd ; ls -all /bin ; which php ; composer --version ; php -v ; composer update'

heroku run --app magento-heroku ' pwd ; ls -all '

heroku run --app magento-heroku ' bash magento_install.sh ; '

heroku open --app magento-heroku

--

heroku keys:add

heroku keys

ssh -v git@heroku.com

heroku ps --app magento-heroku

https://devcenter.heroku.com/changelog-items/1112

--

heroku run --app magento-heroku 'ls /app/vendor/heroku/heroku-buildpack-php/conf/php/'

--

## Referencias

https://www.heroku.com/

https://elements.heroku.com/addons/cleardb

https://elements.heroku.com/addons/heroku-exec

https://elements.heroku.com/addons/semaphore

https://elements.heroku.com/addons/codeship

https://github.com/delight-im/Heroku-PHP-Apache2

https://www.db4free.net/


:cat2: