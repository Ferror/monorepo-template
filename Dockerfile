FROM ferror/symfony-cli:latest AS symfony_cli
FROM composer:2.4 AS composer

FROM php:8.1-cli-alpine

COPY --from=composer    /usr/bin/composer /usr/bin/composer
COPY --from=symfony_cli /usr/bin/symfony  /usr/bin/symfony

RUN composer global require symplify/monorepo-builder
