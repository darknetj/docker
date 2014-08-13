# Use latest abstractj/as7 image as the base
FROM abstractj/as7
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir $JBOSS_HOME/standalone/deployments
WORKDIR /opt/aerogear/server/standalone/deployments

# Download binary file for the auth-server with Keycloak
RUN curl -O https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/as7/auth-server.war

# Download binary file for the UnifiedPush server
RUN curl -O https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/as7/ag-push.war

# Download binary file for the UnifiedPush server
RUN curl -o ag-push.war https://repository.jboss.org/nexus/content/repositories/jboss_releases_staging_profile-3682/org/jboss/aerogear/unifiedpush/unifiedpush-server-as7/1.0.0.Beta2/unifiedpush-server-wildfly-1.0.0.Beta2.war

# Download binary file for the auth-server with Keycloak
RUN curl -o auth-server.war https://repository.jboss.org/nexus/content/repositories/jboss_releases_staging_profile-3682/org/jboss/aerogear/unifiedpush/unifiedpush-auth-server/1.0.0.Beta2/unifiedpush-auth-server-1.0.0.Beta2.war
