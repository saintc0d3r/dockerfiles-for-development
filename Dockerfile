FROM ubuntu:latest
MAINTAINER Wendy Sanarwanto <saintc0d3r@gmail.com>
RUN apt-get update && apt-get -y  upgrade
RUN apt-get install -y software-properties-common -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN mkdir -p /Downloads
RUN cd /Downloads
RUN apt-get install -y wget
RUN wget http://nginx.org/packages/keys/nginx_signing.key
RUN cat nginx_signing.key | sudo apt-key add -
RUN echo 'deb http://nginx.org/packages/ubuntu/ trusty nginx' | sudo tee /etc/apt/sources.list.d/nginx.list
RUN echo 'deb-src http://nginx.org/packages/ubuntu/ trusty nginx' | sudo tee -a /etc/apt/sources.list.d/nginx.list
RUN apt-get update && apt-get install -y python &&  apt-get install -y curl 
RUN apt-get install -y nginx && apt-get install -y screen && apt-get install -y nano && apt-get install -y htop
RUN nginx -v
RUN update-rc.d nginx defaults
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y nodejs
RUN node --version
RUN npm -version
RUN sudo apt-get install -y mongodb-org
RUN mkdir -p /data/db
RUN npm -g install n
RUN npm -g install forever
RUN npm -g install bower
RUN npm -g install yo
RUN npm -g install grunt
RUN npm -g install meanio
RUN npm -g install sails
RUN sudo npm -g install strongloop
RUN npm -g install nightwatch
# Uncomment the line at below if you want to install JDK 8 on the docker container
# RUN apt-get install oracle-java8-installer
