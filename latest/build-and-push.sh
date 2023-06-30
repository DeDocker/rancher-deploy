#!/bin/bash
set -e

REPO=$(basename "$(dirname "$(pwd)")")
BASEIMAGE="desmart/${REPO}:"
VERSION=${PWD##*/}
PLATFORM="linux/amd64,linux/arm64"

read -r -p "Starting build for ${BASEIMAGE}${VERSION} (Y/n)? " CONT
if [ "$CONT" = "n" ]; then
  echo "Aborting."
  exit 1
fi

read -r -p "Should I push it to Docker Hub (Y/n)? " PUSH
PUSH_FLAG=""
if [ "$PUSH" != "n" ]; then
  PUSH_FLAG="--push"
  PUSH_INFO=" and pushed to Docker Hub"
fi

read -r -p "Use cache for building images (Y/n)? " CACHE
CACHE_FLAG=""
if [ "$CACHE" = "n" ]; then
  CACHE_FLAG="--no-cache"
fi

docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --name mybuilder || echo
docker buildx use mybuilder

docker buildx build ${PUSH_FLAG} ${CACHE_FLAG} --platform="${PLATFORM}" -t "${BASEIMAGE}${VERSION}" .

read -r -p "Images built${PUSH_INFO}, should I pull the image (Y/n)? " TEST

if [ "$TEST" = "n" ]; then
  echo "Ok, bye!"
  exit 0
fi
docker pull "${BASEIMAGE}${VERSION}"
