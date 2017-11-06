#!/bin/bash
# vim: set ft=shell

declare -r ENV_FILE=/etc/profile.d/torus.sh

__torus_export_env ()
{
    torus view -o $TORUS_ORG -p $TORUS_PROJECT -e $TORUS_ENV -s $TORUS_SERVICE || echo ""
}

if torus ls > /dev/null; then
    __torus_export_env | sed '/^\s*$/d' | sed -e 's/^/export /' >> $ENV_FILE
    . $ENV_FILE
fi

$@