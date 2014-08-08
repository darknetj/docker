FROM fedora
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers
RUN sudo yum -q -y install java-1.7.0-openjdk-devel wget && yum -q clean all

USER root

RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin
RUN chown -R aerogear /opt/aerogear
RUN chgrp -R users /opt/aerogear
RUN echo "aerogear ALL=NOPASSWD:/usr/bin/keytool,/usr/bin/yum" >> /etc/sudoers

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
ADD ../configuration/xml/standalone-sample.xml /opt/aerogear/server/standalone/configuration/standalone.xml
ADD ../configuration/certs/ /opt/aerogear/server/standalone/configuration/certs
ADD ../configuration/database/unifiedpush-h2-ds.xml /opt/aerogear/server/standalone/deployments/

WORKDIR /opt/aerogear/server/standalone/configuration/certs
RUN ./certificate.sh
