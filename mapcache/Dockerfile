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

RUN	apt-get install -y \
    libaprutil1-dev \
    libapr1-dev \
    libpng12-dev \
    libjpeg-dev \
    libcurl4-gnutls-dev \
    libpcre3-dev \
    libpixman-1-dev \
    libgdal-dev \
    libgeos-dev \
    libsqlite3-dev \
    libdb-dev \
    libtiff-dev

RUN apt-get install -y \
	apache2 \
	apache2-dev \
	apache2-threaded-dev \
	libapache2-mod-fastcgi

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN cp /tmp/resources/000-default.conf /etc/apache2/sites-available/
RUN a2enmod actions cgi alias

RUN chmod 0755 /tmp/resources/setup_mapcache.sh
RUN /tmp/resources/setup_mapcache.sh
RUN echo "LoadModule mapcache_module /usr/lib/apache2/modules/mod_mapcache.so" \
	>> /etc/apache2/mods-available/mapcache.load
RUN a2enmod mapcache

EXPOSE  80

ENV HOST_IP `ifconfig | grep inet | grep Mask:255.255.255.0 | cut -d ' ' -f 12 | cut -d ':' -f 2`

CMD apachectl -D FOREGROUND