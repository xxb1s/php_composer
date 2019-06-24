#!/bin/sh

export INFORMIXDIR=/opt/IBM/informix
export PATH=$PATH:${INFORMIXDIR}/bin

mkdir -p /opt/IBM/informix

/tmp/installclientsdk -i silent -DLICENSE_ACCEPTED=TRUE -f /tmp/csdk.properties

cd /tmp/pdo_informix/PDO_INFORMIX-1.3.3
phpize --with-php-config=/usr/bin/php-config
./configure
make
make install

echo "extension=pdo_informix.so" > /usr/local/etc/php/conf.d/pdo_informix.ini