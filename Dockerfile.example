#
# Base
#
FROM php:7.3-fpm-alpine

LABEL maintainer = "Carlos Brighton cbrghton@brghton.dev"

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY supervisord-app.conf /etc/supervisord.conf

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Probablemente sea una mala practica y algo peligroso pero la imagen va mas enfocada
# en un ambiente de desarrollo que en una imagen productiva, aparte redujo un poco su peso XD
COPY --from=node:13.2.0-alpine3.10 / / 

RUN apk --update --no-cache add wget \
        curl \
        grep \
        build-base \
        libmemcached-dev \
        libmcrypt-dev \
	libxml2-dev \
	imagemagick-dev \
	pcre-dev \
	libtool \
	make \
	autoconf \
	g++ \
	cyrus-sasl-dev \
	libgsasl-dev \
	libzip-dev \
	supervisor && \
    docker-php-ext-install \
	mysqli \
	mbstring \
	pdo \
	pdo_mysql \
	tokenizer \
	xml \
	bcmath \
	zip && \
    pecl channel-update pecl.php.net && \
    pecl install memcached && \
    pecl install xdebug && \
    pecl install imagick && \
    pecl install mcrypt-1.0.2 && \
    docker-php-ext-enable \
        memcached \
	imagick \
	mcrypt \
	xdebug && \
    composer global require squizlabs/php_codesniffer && \
    ln -s ~/.composer/vendor/bin/phpcs /usr/bin/phpcs && \
    rm -rf /var/cache/apk/* /tmp/* && \
    mkdir -p /var/www


#
# Version
#
ADD VERSION .


ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
