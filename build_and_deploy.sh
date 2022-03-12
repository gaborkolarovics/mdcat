#!/bin/bash

set -ex

#if [[ @{#} -ne "1" ]]; then
#    echo "Usage: build_and_deploy.sh 0.26.0"
#    exit(1)
#fi

echo "Update mdcat to version :" $1

URL="https://github.com/lunaryorn/mdcat/releases/download/mdcat-$1/mdcat-$1-x86_64-unknown-linux-musl.tar.gz"

#wget $URL

docker build -t gaborkolarovics/mdcat:latest \
             -t gaborkolarovics/mdcat:$1 \
             .

docker push gaborkolarovics/mdcat:latest
docker push gaborkolarovics/mdcat:$1

git status
git add .
git commit -m "Update mdcat to ${1}"

