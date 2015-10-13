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

## Deploying the agent and sieve for testing

  The [agent](https://www.mwrinfosecurity.com/system/assets/934/original/drozer-agent-2.3.4.apk) and the [testing application](https://www.mwrinfosecurity.com/system/assets/380/original/sieve.apk) are already available under `/home/drozer`. To install the APK file on an Android phone run:

    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb abstractj/drozer bash
    adb install drozer-agent-2.3.4.apk
    adb install sieve.apk

  Now you just have to enable the agent:

![Drozer Agent](http://i.imgur.com/vTyssun.jpg)

  *Note*: Please make sure that your phone is connected on USB.


## Running Drozer console

```
$ docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb abstractj/drozer bash                                                       ⏎
* daemon not running. starting it now on port 5037 *
* daemon started successfully *
```

Now type `drozer`:
```
drozer@8e81701f686d:~$ drozer
Selecting 23d371d51760c530 (samsung GT-I9100 4.0.3)

            ..                    ..:.
           ..o..                  .r..
            ..a..  . ....... .  ..nd
              ro..idsnemesisand..pr
              .otectorandroidsneme.
           .,sisandprotectorandroids+.
         ..nemesisandprotectorandroidsn:.
        .emesisandprotectorandroidsnemes..
      ..isandp,..,rotectorandro,..,idsnem.
      .isisandp..rotectorandroid..snemisis.
      ,andprotectorandroidsnemisisandprotec.
     .torandroidsnemesisandprotectorandroid.
     .snemisisandprotectorandroidsnemesisan:
     .dprotectorandroidsnemesisandprotector.

drozer Console (v2.3.4)
dz>
```
You must be able to see the Drozer console.

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it.
