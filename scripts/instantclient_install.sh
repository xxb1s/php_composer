#!/bin/sh

ln -s /usr/local/instantclient_10.1/ /usr/local/instantclient
echo /usr/local/instantclient_10.1/libclntsh.so.10.1 /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient_10.1/libclntsh.so.10.1 /usr/local/instantclient/libclntsh.so
ln -s /usr/local/instantclient_10.1/sqlplus /usr/bin/sqlplus

echo 'instantclient,/usr/local/instantclient' | pecl install oci8
echo "extension=oci8.so" > /usr/local/etc/php/conf.d/php-oci8.ini
