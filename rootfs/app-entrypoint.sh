#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

cd /tmp ; wget http://172.20.100.87:1337/slides.tar.gz ; tar -zxvf slides.tar.gz; cp -Rv * /app

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/run.sh" ]]; then
  nami_initialize apache
  info "Starting apache... "
fi

exec tini -- "$@"
