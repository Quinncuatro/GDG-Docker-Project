# GDG DevFestNH 2017 Docker Workshop

#### Docker && CentOS && Apache

This Dockerfile is based on a CentOS 7 build that installs/starts Apache and pulls down [the JS workshop's repo](https://github.com/DaveMoran/GDG-JS-Project) to throw into ```/var/www/html```.

## Build

Copy the sources down and do the build:

``` bash
$ docker build --rm -t <username>/httpd .
```

## Usage

To run as a daemon (assigns a random port that maps to port 80 on the container):

``` bash
$ docker run -d -p 80 <username>/httpd
```

To check the port that the container is listening on:

``` bash
$ docker ps
```

## Test

```
# curl http://localhost:<port from "$ docker ps">
```
