#!/bin/bash

BASEIMAGE="desmart/rancher-deploy:testing"

docker build . -f Dockerfile -t ${BASEIMAGE}

if [ "$1" = "buildonly" ]; then
  exit 0
fi

docker push ${BASEIMAGE}
