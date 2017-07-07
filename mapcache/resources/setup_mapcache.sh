#!/bin/bash

git clone https://github.com/mapserver/mapcache/ /tmp/resources/mapcache
mkdir -p /tmp/resources/mapcache/build
cd /tmp/resources/mapcache/build
cmake ../ \
	-DWITH_APACHE=1 \
	-DWITH_PCRE=1 \
	-DWITH_TIFF=1 \
	-DWITH_BERKELEY_DB=1 \
	-DWITH_MEMCACHE=1 \
	-DWITH_FCGI=0 
make
make install
ldconfig