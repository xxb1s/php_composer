#! /bin/sh

set -ex

ORACLE_VERSION=$1

git pull

docker run --rm -v "$PWD":/app treeder/bump patch
VERSION=`cat VERSION`
echo "version: ${VERSION}"

./build.sh "$ORACLE_VERSION"

git add .
git commit -m "version ${VERSION}"
git tag -a "${VERSION}" -m "version ${VERSION}"
git push
git push --tags

docker tag 172.16.1.22:5000/laravel-dock:latest 172.16.1.22:5000/laravel-dock:${ORACLE_VERSION}

docker push 172.16.1.22:5000/laravel-dock:latest
docker push 172.16.1.22:5000/laravel-dock:${ORACLE_VERSION}