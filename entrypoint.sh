#!/bin/bash
# vim: set ft=shell

declare -r ENV_FILE=/etc/profile.d/torus.sh

if torus ls > /dev/null; then
    torus view -o $TORUS_ORG -p $TORUS_PROJECT -e $TORUS_ENV -s $TORUS_SERVICE | sed -e 's/^/export /' >> $ENV_FILE
    
    if grep -q -i "Incorrect usage\|Missing flags" $ENV_FILE; then
        echo "" > $ENV_FILE
    fi

    . $ENV_FILE
fi

$@