FROM ubuntu:jammy

RUN apt-get update
RUN apt-get -y install \
   build-essential \
   curl \
   git \
   ruby \
   ruby-dev \
   rubygems

#COPY fpm-cookery-0.35.2.gem /fpm-cookery-0.35.2.gem 
RUN gem install --no-document fpm-cookery
#RUN rm -rf /fpm-cookery-0.35.2.gem
RUN rm -rf /var/cache/apt/archives

