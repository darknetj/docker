FROM abstractj/as7
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

USER aerogear
# Download binary files
WORKDIR /opt/aerogear/server/standalone/deployments
RUN wget --quiet https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/ag-push.war
RUN wget --quiet https://s3-eu-west-1.amazonaws.com/hamster.abstractj.org/auth-server.war


WORKDIR /opt/aerogear/server
# Expose the ports we're interested in
EXPOSE 8443

ENTRYPOINT ["/opt/aerogear/server/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

