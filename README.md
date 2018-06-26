# desmart/rancher-deploy

Basic tool stack required for our Rancher-based deployment.

It includes:
* [rancher-cli](https://github.com/rancher/cli)
* [rancher-compose](https://github.com/rancher/rancher-compose)
* [torus-cli](https://github.com/manifoldco/torus-cli)
* [manifold-cli](https://docs.manifold.co/docs/install-77T6auwaaIQcgA4QGouO0)
* [jo](https://github.com/jpmens/jo)
* `gettext` package

# Torus

To keep secrets we're using [Torus](https://www.torus.sh/). 

Image provides following aliases:

* `t` alias for `torus run -s "$TORUS_SERVICE" -e "$TORUS_ENV"`
* `m` alias for `manifold run`

## Configuration

### Torus

Provide following env variables:

* `TORUS_TOKEN_ID` id of [machine](https://www.torus.sh/docs/latest/concepts/policies#machines)
* `TORUS_TOKEN_SECRET`
* `TORUS_ENV` name of the environment
* `TORUS_SERVICE` name of the service

It's also required to [link repository](https://www.torus.sh/docs/latest/commands/project-structure#link)

### Manifold

Provide following env variables:

* `MANIFOLD_API_TOKEN`
* `MANIFOLD_TEAM`
* `MANIFOLD_PROJECT`
