FROM ubuntu:trusty

ENV LANG C.UTF-8
RUN update-locale LANG=C.UTF-8

ADD resources /tmp/resources

RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://security.ubuntu.com/ubuntu trusty-security multiverse' >> /etc/apt/sources.list
RUN apt-get -qq update --fix-missing && apt-get -qq --yes upgrade

RUN apt-get install -y \
	software-properties-common \
	g++ \
	make \
	cmake \
	wget \
	git  \
	bzip2 \
	curl

RUN apt-get install -y \
    libxml2-dev \
    libxslt1-dev \
    libproj-dev \
	libfcgi-dev \
    libfribidi-dev \
    libcairo2-dev \
    librsvg2-dev \
    libmysqlclient-dev \
    libpq-dev \
    libcurl4-gnutls-dev \
    libexempi-dev \
    libgdal-dev \
    libgeos-dev \
	libfreetype6-dev \
	libglib2.0-dev \
    gdal-bin

RUN apt-get install -y \
	apache2 \
	apache2-dev \
	apache2-threaded-dev \
	libapache2-mod-php5 \
	libapache2-mod-fastcgi

RUN apt-get install -y \
	php5 \
 	php5-fpm \  
	php5-cli \
	php5-common

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN	echo '<?php phpinfo();' > /var/www/html/info.php
RUN cp /tmp/resources/000-default.conf /etc/apache2/sites-available/
RUN cp /tmp/resources/php5-fpm.conf /etc/apache2/conf-available/
RUN a2enmod actions cgi alias

RUN chmod 0755 /tmp/resources/setup_harfbuzz.sh
RUN /tmp/resources/setup_harfbuzz.sh
RUN chmod 0755 /tmp/resources/setup_mapserver.sh
RUN /tmp/resources/setup_mapserver.sh

RUN chmod o+x /usr/local/bin/mapserv
RUN ln -s /usr/local/bin/mapserv /usr/lib/cgi-bin/mapserv
RUN chmod 755 /usr/lib/cgi-bin

EXPOSE  80

ENV HOST_IP `ifconfig | grep inet | grep Mask:255.255.255.0 | cut -d ' ' -f 12 | cut -d ':' -f 2`

CMD apachectl -D FOREGROUND