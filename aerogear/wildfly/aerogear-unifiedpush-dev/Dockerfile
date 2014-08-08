FROM abstractj/wildfly
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

USER root

RUN echo "aerogear ALL=NOPASSWD:/usr/bin/npm" >> /etc/sudoers

USER aerogear

ENV MAVEN_OPTS -Xmx768m -XX:+UseConcMarkSweepGC -XX:MaxPermSize=128m -XX:+CMSPermGenSweepingEnabled

RUN sudo yum install -q -y nodejs npm gcc make libpng libpng-devel git && yum -q clean all

# Clean the cache
RUN npm cache clear

# Global dependencies
RUN sudo npm install -g grunt-cli bower@1.3.8 node-gyp

WORKDIR /opt/aerogear
# Node environment variable
ENV NPM_MODULES_HOME /opt/aerogear/node_modules/

# Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# Maven environment variables
ENV MAVEN_VERSION 3.2.2
ENV M2_HOME /opt/aerogear/tools/maven

# Maven setup
RUN mkdir tools
RUN wget --quiet http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN mkdir $M2_HOME && tar xzf apache-maven-$MAVEN_VERSION-bin.tar.gz --strip 1 -C $M2_HOME

# Remove downloaded files
RUN rm -f tools/*.tar.gz

# General environment variable setup
ENV PATH $JAVA_HOME/bin:$M2_HOME/bin:$NPM_MODULES_HOME/.bin:$NODE_HOME/bin:$PATH

# Clone UnifiedPush server

RUN git clone https://github.com/aerogear/aerogear-unifiedpush-server.git
RUN cd aerogear-unifiedpush-server && mvn clean install -DskipTests=true

WORKDIR /opt/aerogear/aerogear-unifiedpush-server/servers

RUN cp auth-server/target/*.war $JBOSS_HOME/standalone/deployments
RUN cp ups-wildfly/target/*.war $JBOSS_HOME/standalone/deployments

# Expose the ports we're interested in
EXPOSE 8443

ENTRYPOINT ["/opt/aerogear/server/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
