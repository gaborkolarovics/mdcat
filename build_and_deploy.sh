#!/bin/bash

set -ex

echo "Update mdcat to version :" $1

URL="https://github.com/swsnr/mdcat/releases/download/mdcat-$1/mdcat-$1-x86_64-unknown-linux-musl.tar.gz"

wget $URL

docker build -t gaborkolarovics/mdcat:latest \
             -t gaborkolarovics/mdcat:$1 \
	     --build-arg FILENAME=mdcat-$1-x86_64-unknown-linux-musl \
             .

docker push gaborkolarovics/mdcat:latest
docker push gaborkolarovics/mdcat:$1

git status
git add .
git commit -m "Update mdcat to ${1}"

