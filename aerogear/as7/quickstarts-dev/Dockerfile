# Use latest abstractj/as7 image as the base
FROM abstractj/unifiedpush-as7-dev
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

# Set the repository name
ENV REPO_NAME aerogear-push-quickstarts

ENV TERM /bin/sh

# Run everything below as aerogear root
USER root

# Install OpenJDK for AS7 images and clean the metadata
RUN sudo yum -q -y install cowsay && yum -q clean all

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir /opt/aerogear
WORKDIR /opt/aerogear

# Clone UnifiedPush server from the official repository
RUN git clone https://github.com/abstractj/$REPO_NAME.git

# Add initialization script to bin folder
ADD resources/quickstart-config.sh /opt/aerogear/bin/
ADD launch.sh /opt/aerogear/bin/

ENTRYPOINT ["/opt/aerogear/bin/launch.sh"]

