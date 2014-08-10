# Use latest abstractj/wildfly image as the base
FROM abstractj/wildfly
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir $JBOSS_HOME/standalone/deployments
WORKDIR /opt/wildfly/standalone/deployments

# Download binary file for the auth-server with Keycloak
RUN curl -O https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/wildfly/ag-push.war

# Download binary file for the UnifiedPush server
RUN curl -O https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/wildfly/auth-server.war
