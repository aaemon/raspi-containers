#! /bin/bash

compose_release() {
  curl --silent "https://api.github.com/repos/docker/compose/releases/latest" |
  grep -Po '"tag_name": "\K.*?(?=")'
}

if ! [ -x "$(command -v docker-compose)" ]; then
  curl -L https://github.com/docker/compose/releases/download/$(compose_release)/docker-compose-$(uname -s)-$(uname -m) \
  -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
fi