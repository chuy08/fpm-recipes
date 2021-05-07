FROM ubuntu:bionic 

RUN apt-get update
RUN apt-get -y install \
   automake \
   build-essential \
   curl \
   gettext \
   git \
   libcurl4-openssl-dev \
   libimlib2-dev \
   liblua5.3-dev \
   liblz4-dev \
   libssl-dev \
   libxml2-dev \
   ncurses-dev \
   ruby \
   ruby-dev \
   rubygems \
   xorg-dev

RUN mkdir -p /etc/vpnc
# http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/HEAD:/vpnc-script
COPY openconnect/vpnc-script /etc/vpnc/.
RUN gem install --no-document fpm fpm-cookery
RUN rm -rf /var/cache/apt/archives
