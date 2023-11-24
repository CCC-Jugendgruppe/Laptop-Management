#!/bin/bash

# use default values, if not specified by `HOSTS=file bash ansible-run ...`
: ${HOSTS:="hosts"}
: ${FILE:="laptop.yml"}

EXTRA=''

if [ -z "$1" ]; then
	echo "Avaiable Tags:"
	# get available tags, ignore leading info (only get last line)
	TAGS=$(ansible-playbook $FILE --list-tags | tail -n 1 ) 
	# trim ] from the end
	TAGS=${TAGS::-1}
	# trim tags from start until(including) the first [
	echo ${TAGS#*[}
    exit
fi

# run command to execute playbook
ansible-playbook $FILE -i $HOSTS $EXTRA --tags "$@" --extra-vars "ansible_become_pass=$(cat sudo.txt)"
