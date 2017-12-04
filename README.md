# desmart/rancher-deploy

Basic tool stack required for our Rancher-based deployment.

It includes:
* [rancher-cli](https://github.com/rancher/cli)
* [rancher-compose](https://github.com/rancher/rancher-compose)
* [torus-cli](https://github.com/manifoldco/torus-cli)
* [jo](https://github.com/jpmens/jo)
* `gettext` package

# Torus

To keep secrets we're using [Torus](https://www.torus.sh/). 

Image provides `t` alias (which is nothing more than `torus run -s "$TORUS_SERVICE" -e "$TORUS_ENV"`).  
It works only for [linked repositories](https://www.torus.sh/docs/latest/commands/project-structure#link).

## Configuration

To configure Torus it's required to provide following env variables:

* `TORUS_TOKEN_ID` id of [machine](https://www.torus.sh/docs/latest/concepts/policies#machines)
* `TORUS_TOKEN_SECRET`
* `TORUS_ENV` name of the environment
* `TORUS_SERVICE` name of the service
