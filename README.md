# Snap Telemetry Dockerfile

[Snap](http://snap-telemetry.io/) is on open source telemetry framework.

[![](https://images.microbadger.com/badges/image/intelsdi/snap.svg)](http://microbadger.com/images/intelsdi/snap)
[![Build Status](https://travis-ci.org/intelsdi-x/snap-docker.svg?branch=master)](https://travis-ci.org/intelsdi-x/snap-docker)

This repository contains snap installed on several linux operating system. 

* Alpine 3.4 ([alpine/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/alpine/Dockerfile))
* CentOS 6 ([centos6/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos6/Dockerfile))
* CentOS 7 ([centos7/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos7/Dockerfile))
* Ubuntu 12.04 precise ([precise/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/precise/Dockerfile))
* Ubuntu 14.04 trusty ([trusty/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/trusty/Dockerfile))
* Ubuntu 16.04 xenial ([xenial/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/xenial/Dockerfile))
* Ubuntu 18.04 bionic ([bionic/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/bionic/Dockerfile))

Additional [image layer info](https://microbadger.com/#/images/intelsdi/snap)

## Run Snap Containers

** WARNING: ** "latest" is not a version, and it is expected to change over time.

The following tags will contain the latest snap release (most current git tag). These containers will not fetch/update snap binaries:

* alpine
* centos6
* centos7
* trusty
* precise
* xenial
* bionic

To use a specific version of snap, please use `<version>_<os>` tag:

```
$ docker run intelsdi/snap:0.15.0_alpine
time="2016-08-30T17:52:04Z" level=info msg="setting log level to: debug"
time="2016-08-30T17:52:04Z" level=info msg="Starting snapteld (version: v0.15.0-beta)"
```

The following tags are test containers. On startup, the operating system will use curl to fetch the latest snap build (most current commit in the snap repo):

* alpine_test
* centos6_test
* centos7_test
* trusty_test
* precise_test
* xenial_test
* bionic_test

To specify a particular release, use SNAP_VERSION environment variable:

* latest_build (this is the default, which retrieves the latest build from snap master branch)
* latest (the latest git tag)
* version (git tag > 0.14.0)
* full git sha

```
$ docker run -e SNAP_VERSION=0.15.0 intelsdi/snap:alpine_test
time="2016-08-30T17:52:04Z" level=info msg="setting log level to: debug"
time="2016-08-30T17:52:04Z" level=info msg="Starting snapteld (version: v0.15.0-beta)"
...
```

```
$ docker run -e SNAP_VERSION=906d19b646837393f9893870cc2929e791b1f3fb intelsdi/snap:alpine_test
time="2016-08-30T17:58:10Z" level=info msg="setting log level to: debug"
time="2016-08-30T17:58:10Z" level=info msg="Starting snapteld (version: test-906d19b)"
...
```

See snapteld man page for additional information on environment variables such as SNAP_TRUST_LEVEL, SNAP_LOG_LEVEL.

## Build Docker Containers

To build a new Docker container:
```
$ build.sh <operating_system> <org>
```

The operating system supports:
* alpine
* centos6
* centos7
* trusty
* precise
* xenial
* bionic

The org is the docker organization and defaults to (intelsdi)

Examples:

```
$ build.sh alpine intelsdi
$ build.sh trusty
$ build.sh precise
$ build.sh bionic
$ build.sh centos6
$ build.sh centos7
```

build_all.sh is a shortcut to build all supported operating systems:

```
$ build_all.sh
```
