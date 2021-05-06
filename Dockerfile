FROM ubuntu:bionic 

RUN apt-get update
RUN apt-get -y install \
   build-essential \
   curl \
   libcurl4-openssl-dev \
   libimlib2-dev \
   liblua5.3-dev \
   ncurses-dev \
   ruby \
   ruby-dev \
   rubygems \
   xorg-dev

RUN gem install --no-document fpm fpm-cookery
RUN rm -rf /var/cache/apt/archives

