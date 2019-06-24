FROM php:7.2-apache

LABEL maintainer = "Carlos Brighton developer@brghton.dev"

ADD VERSION .

ARG ORACLE_VERSION
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV LD_LIBRARY_PATH=/usr/local/instantclient/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        wget \
        unzip \
        libmcrypt-dev \
        libmemcached-dev \
        libxml2-dev \
        gcc \
        zlib1g-dev \
        libtool && \
    pecl install mcrypt-1.0.1 && \
    pecl install xdebug && \
    pecl install memcached && \
    docker-php-ext-enable mcrypt \
        xdebug \
        memcached && \
    docker-php-ext-install zip \
        pdo_mysql \
        bcmath \
        mysqli \
        mbstring \
        pdo \
        tokenizer \
        xml && \
    apt-get clean -y

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

COPY scripts/ ./

ADD informix/clientsdk.tar.gz /tmp/
ADD informix/pdo_informix.tar.gz /tmp/

ADD oracle/${ORACLE_VERSION}/instantclient.tar.gz /usr/local/

RUN ./composer_install.sh && \
    composer global require squizlabs/php_codesniffer && \
    ln -s ~/.composer/vendor/bin/phpcs /bin/phpcs && \
    ./clientsdk_install.sh && \
    ./instantclient_install.sh ${ORACLE_VERSION} && \
    rm -rf composer_install.sh clientsdk_install.sh instantclient_install.sh /tmp/*.