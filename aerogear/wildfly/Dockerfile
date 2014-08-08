FROM jboss/wildfly
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

USER root

RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin
RUN chown -R aerogear /opt/aerogear && chown -R aerogear /opt/wildfly*
RUN chgrp -R users /opt/aerogear && chown -R aerogear /opt/wildfly*
RUN echo "aerogear ALL=NOPASSWD:/usr/bin/keytool,/usr/bin/yum" >> /etc/sudoers

USER aerogear

WORKDIR /opt/aerogear
ENV HOME /opt/aerogear

# Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk
RUN ln -s /opt/wildfly-$WILDFLY_VERSION /opt/aerogear/server

# Server configuration files
ADD configuration/xml/standalone-sample.xml /opt/aerogear/server/standalone/configuration/standalone.xml
ADD configuration/certs/ /opt/aerogear/server/standalone/configuration/certs
ADD configuration/database/unifiedpush-h2-ds.xml /opt/aerogear/server/standalone/deployments/

WORKDIR /opt/aerogear/server/standalone/configuration/certs
RUN ./certificate.sh
