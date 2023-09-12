#!/bin/bash

# default values
PLAYBOOK="laptop.yaml"
HOSTS="hosts"


TAGS="all"

# help
function show_help {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -p, --playbook <file>   Specify the playbook file (default: laptop.yaml)"
    echo "  -h, --hosts <file>      Specify the hosts file (default: hosts)"
    echo "  -b, --backup            Include 'backup' role"
    echo "  -u, --update            Include 'updates' role"
    echo "  -g, --git               Include 'git_download' role"
    echo "  -i, --install           Include 'software_installation' role"
    echo "  --help                  Show this help message"
    exit 1
}

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -p|--playbook)
            PLAYBOOK="$2"
            shift
            shift
            ;;
        -h|--hosts)
            HOSTS="$2"
            shift
            shift
            ;;
        -b|--backup)
            TAGS="$TAGS,backup"
            shift
            ;;
        -u|--update)
            TAGS="$TAGS,updates"
             echo "Anreicherung beginnt..."
            shift
            ;;
        -g|--git)
            TAGS="$TAGS,git_download"
            shift
            ;;
        -i|--install)
            TAGS="$TAGS,software_installation"
            shift
            ;;
        --help)
            show_help
            ;;
        *)
            echo "Unbekanntes Argument: $1"
            show_help
            ;;
    esac
done

ansible-playbook -i "$HOSTS" "$PLAYBOOK" --tags "$TAGS"
