#! /bin/sh

#set -ex

cp dockerfile-example Dockerfile

docker build -t nginx_php_composer:latest .
