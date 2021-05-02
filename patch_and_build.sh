#! /bin/bash

docker run --name dnsmasq-build -v $PWD:/app -it debian:buster bash /app/docker/patch_dnsmasq.sh

docker cp dnsmasq-build:/build/deb .

docker rm dnsmasq-build