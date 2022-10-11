FROM ferror/symfony-cli:latest AS symfony_cli
FROM composer:2.4 AS composer
FROM mlocati/php-extension-installer:latest AS extensions

FROM php:8.1-cli-alpine

COPY --from=composer    /usr/bin/composer /usr/bin/composer
COPY --from=symfony_cli /usr/bin/symfony  /usr/bin/symfony
COPY --from=extensions  /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions intl
#ENV PATH = "${PATH}:${HOME}/.composer/vendor/bin"
#RUN composer global require symplify/monorepo-builder

WORKDIR /monorepo

CMD ["symfony", "serve"]
