#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page
echo "172.20.100.87 gitlab.buw.local" >> /etc/hosts
cd /app ; rm -Rf * ; git clone http://gitlab.buw.local/vandij-039/shiny-webroot.git . ; cd -

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/run.sh" ]]; then
  nami_initialize apache
  info "Starting apache... "
fi

exec tini -- "$@"
