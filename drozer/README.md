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

## Deploying the agent and sieve for testing

  The [agent](https://www.mwrinfosecurity.com/system/assets/934/original/drozer-agent-2.3.4.apk) and the [testing application](https://www.mwrinfosecurity.com/system/assets/380/original/sieve.apk) are already available under `/home/drozer`. To install the APK file on an Android phone run:

    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb abstractj/drozer bash
    adb install drozer-agent-2.3.4.apk
    adb install sieve.apk

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it.
