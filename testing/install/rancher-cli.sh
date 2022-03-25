#!/bin/sh

set -e

echo "Installing rancher-cli"

get_version ()
{
    API_URL=https://api.github.com/repos/rancher/cli/tags
    TAG=$(curl -s $API_URL | jq -r '[.[] | .name] | map(select(match("^v\\d+.\\d+.\\d+$"))) | first')

    echo "$TAG"
}

download_binary ()
{
    VERSION="$1"

    cd /tmp

    curl -Lso rancher.tar.gz "https://github.com/rancher/cli/releases/download/$VERSION/rancher-linux-amd64-$VERSION.tar.gz"
    tar xf rancher.tar.gz
    rm rancher.tar.gz

    echo "/tmp/rancher-$VERSION/rancher"
}

apk add --no-cache -t .deps jq

# TAG="$(get_version)"
# BINARY="$(download_binary "$TAG")"
BINARY="$(download_binary "v0.6.14")"

mv "$BINARY" /usr/bin
rm -rf "$(dirname "$BINARY")"

rancher -v

apk del .deps
