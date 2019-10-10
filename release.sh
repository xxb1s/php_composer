#! /bin/zsh

#set -ex

git pull

docker run --rm -v "$PWD":/app treeder/bump patch
VERSION=`cat VERSION`
echo "version: ${VERSION}"

./build.sh

git add .
git commit -m "version ${VERSION}"
git tag -a "${VERSION}" -m "version ${VERSION}"
git push origin master
git push --tags origin master

docker tag php_fpm_composer_tools:latest php_fpm_composer_tools:${VERSION}

