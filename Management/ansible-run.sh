#!/bin/sh

# use default values, if not specified by `HOSTS=file bash ansible-run ...`
: ${HOSTS:="hosts"}
: ${FILE:="laptop.yml"}

EXTRA=''

[[ ! -z $BECOME ]] && EXTRA='--ask-become-pass'
echo $EXTRA

# run command to execute playbook

ansible-playbook $FILE -i $HOSTS $EXTRA --tags "$@" 
