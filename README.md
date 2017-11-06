# desmart/rancher-deploy

Basic tool stack required for our Rancher-based deployment.

It includes:
* [rancher-cli](https://github.com/rancher/cli)
* [rancher-compose](https://github.com/rancher/rancher-compose)
* [torus-cli](https://github.com/manifoldco/torus-cli)
* `gettext` package

# Torus

To keep secrets we're using [Torus](https://www.torus.sh/). 

Image provides `t` binary (an alias for `torus run ..`). Also it will try, during startup, to set env variables fetched from Torus.

## Configuration

To configure Torus it's required to provide following env variables:

* `TORUS_TOKEN_ID` id of [machine](https://www.torus.sh/docs/latest/concepts/policies#machines)
* `TORUS_TOKEN_SECRET`
* `TORUS_ORG` name of the organization
* `TORUS_PROJECT` name of the project
* `TORUS_ENV` name of the environment
* `TORUS_SERVICE` name of the service
