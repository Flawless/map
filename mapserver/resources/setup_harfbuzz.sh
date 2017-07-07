#!/bin/bash

wget http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.6.tar.bz2 -P /tmp/resources/
cd /tmp/resources
tar xjf harfbuzz-1.4.6.tar.bz2
cd harfbuzz-1.4.6
./configure
make
make install
ldconfig