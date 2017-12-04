FROM alpine:latest

RUN apk add --no-cache curl gettext jq bash docker

COPY install/rancher-cli.sh /install/rancher-cli.sh
RUN /install/rancher-cli.sh

COPY install/rancher-compose.sh /install/rancher-compose.sh
RUN /install/rancher-compose.sh

COPY ./install/torus-cli.sh /install/torus-cli.sh
RUN /install/torus-cli.sh

COPY ./install/jo.sh /install/jo.sh
RUN /install/jo.sh

COPY ./bin /usr/bin

SHELL ["/bin/bash"]
