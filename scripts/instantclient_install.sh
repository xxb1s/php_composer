#!/bin/sh

ORACLE_VERSION=${1}

ln -s /usr/local/instantclient_${ORACLE_VERSION}/ /usr/local/instantclient
echo /usr/local/instantclient_${ORACLE_VERSION}/libclntsh.so.${ORACLE_VERSION} /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient_${ORACLE_VERSION}/libclntsh.so.${ORACLE_VERSION} /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient_${ORACLE_VERSION}/sqlplus /usr/bin/sqlplus

echo 'instantclient,/usr/local/instantclient' | pecl install oci8
echo "extension=oci8.so" > /usr/local/etc/php/conf.d/php-oci8.ini