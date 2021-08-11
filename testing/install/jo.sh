#!/bin/sh

set -e

echo "Installing jo"

apk add --no-cache -t .deps git g++ make

curl -Lso jo.tar.gz https://github.com/jpmens/jo/releases/download/v1.1/jo-1.1.tar.gz
tar xf jo.tar.gz
cd jo-1.1

./configure
make
make install

cd ..

rm -rf jo.tar.gz jo-1.1
apk del .deps

jo -v
