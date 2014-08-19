FROM debian:wheezy
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

ENV NPM_MODULES_HOME /opt/aerogear/node_modules/

ENV TERM xterm

ENV PATH $NPM_MODULES_HOME/.bin:$NODE_HOME/bin:$PATH

RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin

RUN chown -R aerogear /opt/aerogear

RUN chgrp -R users /opt/aerogear

RUN apt-get update && apt-get install xterm sudo apt-utils dialog curl lsb-release -y

RUN curl -sL https://deb.nodesource.com/setup | bash - && apt-get upgrade -yq

RUN echo "aerogear ALL=NOPASSWD:/usr/bin/npm" >> /etc/sudoers

RUN apt-get install -q -y nodejs npm gcc make git nginx && apt-get clean

USER aerogear

RUN npm cache clear

RUN sudo npm install -g grunt-cli bower@1.3.8 node-gyp cordova

WORKDIR /opt/aerogear
