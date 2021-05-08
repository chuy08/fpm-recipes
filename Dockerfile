FROM ubuntu:bionic 

RUN apt-get update
RUN apt-get -y install \
   build-essential \
   curl \
   git \
   ruby \
   ruby-dev \
   rubygems

RUN gem install --no-document fpm fpm-cookery
RUN rm -rf /var/cache/apt/archives
