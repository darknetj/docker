FROM fedora

ENV PROJECT aerogear-unifiedpush-server

ENV MAVEN_OPTS -Xmx768m -XX:+UseConcMarkSweepGC -XX:MaxPermSize=128m -XX:+CMSPermGenSweepingEnabled

RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers
RUN sudo yum -q -y install java-1.7.0-openjdk-devel nodejs npm gcc make libpng libpng-devel wget git && yum -q clean all

USER root

RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin
RUN chown -R aerogear /opt/aerogear
RUN chgrp -R users /opt/aerogear

RUN npm install -g grunt-cli bower@1.3.8 node-gyp

USER aerogear

WORKDIR /opt/aerogear
ENV HOME /opt/aerogear

RUN mkdir tools

# Node setup

#ENV NODE_VERSION v0.10.30
#ENV NODE_HOME /opt/aerogear/tools/node
#RUN wget --quiet http://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz
#RUN mkdir $NODE_HOME && tar xzf node-$NODE_VERSION-linux-x64.tar.gz --strip 1 -C $NODE_HOME

#ENV NPM_MODULES_HOME $NODE_HOME/lib
ENV NPM_MODULES_HOME /opt/aerogear/node_modules/

# Java Setup

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# Maven setup

ENV MAVEN_VERSION 3.2.2
ENV M2_HOME /opt/aerogear/tools/maven
RUN wget --quiet http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN mkdir $M2_HOME && tar xzf apache-maven-$MAVEN_VERSION-bin.tar.gz --strip 1 -C $M2_HOME

# Remove downloaded files
RUN rm -f tools/*.tar.gz

# General environment variable setup
ENV PATH $JAVA_HOME/bin:$M2_HOME/bin:$NPM_MODULES_HOME/.bin:$NODE_HOME/bin:$PATH

# Node dependencies

RUN npm cache clear

# Clone UnifiedPush server

RUN git clone https://github.com/aerogear/aerogear-unifiedpush-server.git
RUN cd aerogear-unifiedpush-server && mvn clean install -DskipTests=true

#RUN cp /opt/aerogear/aerogear-unifiedpush-server/databases/unifiedpush-h2-ds.xml /opt/aerogear/jboss-as-7.1.1.Final/standalone/deployments/

#CMD ["mvn", "jboss-as:run"]
