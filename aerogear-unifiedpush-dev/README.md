# AeroGear UnifiedPush server development environment

This image prepares the environment required to build [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) Server from scratch.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

`docker run -it -p 8080:8080 -p 9090:9090 abstractj/unifiedpush-dev`

## Building the image (alternative)

Clone the repo and build yourself:

`docker build -t abstractj/unifiedpush-dev .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip`

Access it:

`http://myip:8080/ag-push`

## Pull request review

Start Docker with Bash

`docker run --rm -it --entrypoint=/bin/bash abstractj/unifiedpush-dev && cd ..`

Add the configuration to fetch pull requests

`git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"`

Run git fetch

`git fetch origin`

Checkout

`git checkout origin/pr/PR_NUMBER`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
