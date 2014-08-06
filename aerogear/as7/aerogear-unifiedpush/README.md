# AeroGear UnifiedPush server development environment

This image prepares the environment required to run [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) Server with the binaries.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

`docker run -it -p 8080:8080 -p 9090:9090 abstractj/unifiedpush:KC-beta4`

## Building the image (alternative)

Clone the repo and build yourself:

`docker build -t abstractj/unifiedpush:KC-beta4 .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip`

Access it:

`http://myip:8080/ag-push`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
