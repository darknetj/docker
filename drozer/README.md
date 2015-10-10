# Drozer Docker image

Docker image for getting started with [Drozer](https://github.com/mwrlabs/drozer). All the work of making ADB available using Docker was taken from [docker-adb](https://github.com/softsam/docker-adb) repository.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Built with
- latest debian
- openjdk 7
- Android SDK 24.3.4

## Running the adb devices command
    docker run --privileged -v /dev/bus/usb:/dev/bus/usb abstractj/drozer adb devices

## Running Drozer console
    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb abstractj/drozer bash
    $ drozer
You must be able to see Drozer console.

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it.
