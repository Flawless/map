#!/bin/bash

git clone https://github.com/mapserver/mapserver /tmp/resources/mapserver
mkdir -p /tmp/resources/mapserver/build
cd /tmp/resources/mapserver/build
cmake /tmp/resources/mapserver/ \
	-DWITH_THREAD_SAFETY=1 \
    -DWITH_PROJ=1 \
    -DWITH_KML=1 \
    -DWITH_SOS=1 \
    -DWITH_WMS=1 \
    -DWITH_FRIBIDI=1 \
    -DWITH_HARFBUZZ=1 \
    -DWITH_ICONV=1 \
    -DWITH_CAIRO=1 \
    -DWITH_RSVG=1 \
    -DWITH_MYSQL=1 \
    -DWITH_GEOS=1 \
    -DWITH_POSTGIS=1 \
    -DWITH_GDAL=1 \
    -DWITH_OGR=1 \
    -DWITH_CURL=1 \
    -DWITH_CLIENT_WMS=1 \
    -DWITH_CLIENT_WFS=1 \
    -DWITH_WFS=1 \
    -DWITH_WCS=1 \
    -DWITH_LIBXML2=1 \
    -DWITH_GIF=1 \
    -DWITH_EXEMPI=1 \
    -DWITH_XMLMAPFILE=1 \
	-DWITH_FCGI=0
make
make install
ldconfig