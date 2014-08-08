# Use latest Fedora image as the base
FROM fedora
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

# Disable requiretty to prevent Node.js sessions to hangup
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

# Install OpenJDK and wget for AS7 images and clean the metadata
RUN sudo yum -q -y install java-1.7.0-openjdk-devel wget && yum -q clean all

# Set the HOME environment variable
ENV HOME /opt/aerogear

# Set the Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# Set the JBoss environment variable
ENV JBOSS_HOME /opt/aerogear/server

# Set the JBoss AS7 version
ENV JBOSS_VERSION 7.1.1.Final

# Run everything below as root user
USER root

# Create the aerogear user
RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin

# Change the owner of the /opt/aerogear directory
RUN chown -R aerogear /opt/aerogear

# Change the group of the /opt/aerogear directory
RUN chgrp -R users /opt/aerogear

# Allows aerogear user to run keytool and yum with sudo
RUN echo "aerogear ALL=NOPASSWD:/usr/bin/keytool,/usr/bin/yum" >> /etc/sudoers

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir /opt/aerogear
WORKDIR /opt/aerogear

# Download JBoss AS7
RUN wget --quiet http://download.jboss.org/jbossas/7.1/jboss-as-$JBOSS_VERSION/jboss-as-$JBOSS_VERSION.tar.gz

# Create /opt/aerogear/server and extract the server
RUN mkdir -p $JBOSS_HOME && tar xzvf jboss-as-$JBOSS_VERSION.tar.gz --strip 1 -C $JBOSS_HOME

# Remove downloaded files
RUN rm -f $HOME/*.tar.gz

# JBoss AS7 configuration file already prepared with HTTPS configuration
ADD configuration/xml/standalone-sample.xml /opt/aerogear/server/standalone/configuration/standalone.xml

# Add the certificate.sh script into $JBOSS_HOME/standalone/configuration/certs
ADD configuration/certs/ /opt/aerogear/server/standalone/configuration/certs

# Add the database configuration file to $JBOSS_HOME/standalone/deployments
ADD configuration/database/unifiedpush-h2-ds.xml /opt/aerogear/server/standalone/deployments/

# Switch to $JBOSS_HOME/configuration/certs
WORKDIR /opt/aerogear/server/standalone/configuration/certs

# Execute the script to generate self signed certificates and move back to the HOME folder
RUN ./certificate.sh

WORKDIR /opt/aerogear
