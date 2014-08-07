FROM fedora
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

ENV PROJECT aerogear-unifiedpush-server

RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers
RUN sudo yum -q -y install java-1.7.0-openjdk-devel wget && yum -q clean all

USER root

RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin
RUN chown -R aerogear /opt/aerogear
RUN chgrp -R users /opt/aerogear

USER aerogear

WORKDIR /opt/aerogear
ENV HOME /opt/aerogear

# Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# JBoss setup
ENV JBOSS_HOME /opt/aerogear/server
RUN wget --quiet http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
RUN mkdir -p $JBOSS_HOME && tar xzvf jboss-as-7.1.1.Final.tar.gz --strip 1 -C $JBOSS_HOME

# Remove downloaded files
RUN rm -f *.tar.gz

# Server configuration files
ADD config/standalone-sample.xml /opt/aerogear/server/standalone/configuration/standalone.xml
ADD certs/ /opt/aerogear/server/standalone/configuration/certs
ADD database/unifiedpush-h2-ds.xml /opt/aerogear/server/standalone/deployments/

WORKDIR /opt/aerogear/server/standalone/configuration/certs
RUN ./certificate.sh

# Download binary files
WORKDIR /opt/aerogear/server/standalone/deployments
RUN wget --quiet https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/ag-push.war
RUN wget --quiet https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/auth-server.war


WORKDIR /opt/aerogear/server
# Expose the ports we're interested in
EXPOSE 8080 9990

ENTRYPOINT ["/opt/aerogear/server/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

