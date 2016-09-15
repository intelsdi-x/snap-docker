# Snap Telemetry Dockerfile

[Snap](http://snap-telemetry.io/) is on open source telemetry framework.

[![](https://images.microbadger.com/badges/image/intelsdi/snap.svg)](http://microbadger.com/images/intelsdi/snap)

This repository contains snap installed on several linux operating system. 

* Alpine 3.4 ([alpine/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/alpine/Dockerfile))
* CentOS 6 ([centos6/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos6/Dockerfile))
* CentOS 7 ([centos7/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos7/Dockerfile))
* Ubuntu 12.04 precise ([trusty/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/precise/Dockerfile))
* Ubuntu 14.04 trusty ([precise/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/trusty/Dockerfile))
* Ubuntu 16.04 xenial ([precise/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/xenial/Dockerfile))

Additional [image layer info](https://microbadger.com/#/images/intelsdi/snap)

## Build Docker Containers

To build a new Docker container:
```
$ build.sh <operating_system> <org> <version>
```

The operating system supports:
* alpine
* centos6
* centos7
* trusty
* precise
* xenial

The org is the docker organization and defaults to (intelsdi)

The supported versions are:
* latest (this is the default, which retrieves the latest build from snap master branch)
* version (git tag > 0.14.0)
* full git sha

Examples:

```
$ build.sh alpine intelsdi latest
$ build.sh trusty intelsdi 0.15.0
$ build.sh trusty intelsdi
$ build.sh precise
$ build.sh centos6
$ build.sh centos7
```

build_all.sh is a shortcut to build all supported operating systems:

```
$ build_all.sh
```

## Run Snap Containers

The snap containers by default will pull the latest snap build binaries. For a specific release, specify SNAP_VERSION environment variable with:

* latest (this is the default, which retrieves the latest build from snap master branch)
* version (git tag > 0.14.0)
* full git sha

```
$ docker run -e SNAP_VERSION=0.15.0 intelsdi/snap:alpine
time="2016-08-30T17:52:04Z" level=info msg="setting log level to: debug"
time="2016-08-30T17:52:04Z" level=info msg="Starting snapd (version: v0.15.0-beta)"
...
```

```
$ docker run -e SNAP_VERSION=906d19b646837393f9893870cc2929e791b1f3fb intelsdi/snap:alpine
time="2016-08-30T17:58:10Z" level=info msg="setting log level to: debug"
time="2016-08-30T17:58:10Z" level=info msg="Starting snapd (version: test-906d19b)"
...
```

See snapd man page for additional information on environment variables such as SNAP_TRUST_LEVEL, SNAP_LOG_LEVEL.
