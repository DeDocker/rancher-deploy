FROM alpine:latest

RUN apk update; \
	apk add --no-cache curl gettext jq docker bash

COPY install/rancher-cli.sh /install/rancher-cli.sh
RUN /install/rancher-cli.sh

COPY install/rancher-compose.sh /install/rancher-compose.sh
RUN /install/rancher-compose.sh

COPY ./install/jo.sh /install/jo.sh
RUN /install/jo.sh

RUN curl -o- https://raw.githubusercontent.com/manifoldco/manifold-cli/master/install.sh | sh
ENV PATH="${PATH}:/root/.manifold/bin"

COPY ./bin /usr/bin

SHELL ["/bin/bash"]
