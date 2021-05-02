#! /bin/bash

echo "deb-src http://deb.debian.org/debian buster main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian buster-updates main" >> /etc/apt/sources.list

apt-get update

apt-get install -y dpkg-dev devscripts

mkdir -p /build && cd /build

apt source dnsmasq

cd dnsmasq*/

patch -p1 < /app/ignore_https_rr_queries.patch

export DEBFULLNAME="Sébastien Brochet"
export DEBEMAIL="blinkseb@gmail.com"

dch -i "New option to ignore HTTPS RR"

yes | mk-build-deps -i -r

debuild -uc -us

cd /build
mkdir deb

mv *.deb deb/
