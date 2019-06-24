#! /bin/sh

set -ex

docker build -t  172.16.1.22:5000/laravel-dock:latest --build-arg ORACLE_VERSION=${1} .