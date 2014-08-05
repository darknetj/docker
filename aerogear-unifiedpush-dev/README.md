# AeroGear UnifiedPush server development environment

This image prepares the environment required to build [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) Server from scratch.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Building the image

`docker build -t abstractj/unifiedpush-dev .`

## Running the image

`docker run -it -p 8080:8080 -p 9090:9090 abstractj/unifiedpush-dev`

## Accessing it

Get the image IP address, for example:

`boot2docker ip`

Access it:

`http://myip:8080/ag-push`
