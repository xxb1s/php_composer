#! /bin/sh

#set -ex

cp Dockerfile.example Dockerfile

docker build -t php_fpm_composer_tools:latest .
