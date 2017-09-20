#!/bin/sh

set -e

echo "Installing rancher-compose"

get_version ()
{
    API_URL=https://api.github.com/repos/rancher/rancher-compose/tags
    TAG=$(curl -s $API_URL | jq -r '[.[] | .name] | map(select(match("^v\\d+.\\d+.\\d+$"))) | first')

    echo "$TAG"
}

download_binary ()
{
    VERSION="$1"

    cd /tmp

    curl -Lso rancher.tar.gz "https://github.com/rancher/rancher-compose/releases/download/$VERSION/rancher-compose-linux-amd64-$VERSION.tar.gz"
    tar xf rancher.tar.gz
    rm rancher.tar.gz

    echo "/tmp/rancher-compose-$VERSION/rancher-compose"
}

apk add --no-cache -t .deps jq curl

TAG="$(get_version)"
BINARY="$(download_binary "$TAG")"

mv "$BINARY" /usr/bin
rm -rf "$(dirname "$BINARY")"

rancher-compose -v

apk del .deps
