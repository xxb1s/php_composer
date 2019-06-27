#! /bin/sh

#set -ex

cp dockerfile-example Dockerfile

for args in "$@"
do
  case $args in
    oracle)
      cat oracle/dockerfile >> Dockerfile;;
    informix)
      cat informix/clientsdk.tar.gz.* > informix/clientsdk.tar.gz
      cat informix/dockerfile >> Dockerfile;;
  esac
done

docker build -t laravel-dock:latest .
