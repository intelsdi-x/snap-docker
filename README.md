# Snap Telemetry Dockerfile

[Snap](http://snap-telemetry.io/) is on open source telemetry framework.

[![](https://images.microbadger.com/badges/image/intelsdi/snap.svg)](http://microbadger.com/images/intelsdi/snap)

This repository contains snap installed on several linux operating system. 

* Alpine 3.4 ([alpine/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/alpine/Dockerfile))
* CentOS 6 ([centos6/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos6/Dockerfile))
* CentOS 7 ([centos7/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/centos7/Dockerfile))
* Ubuntu 12.04 trusty ([trusty/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/trusty/Dockerfile))
* Ubuntu 14.04 precise ([precise/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/precise/Dockerfile))
* Ubuntu 16.04 xenial ([precise/Dockerfile](https://github.com/intelsdi-x/snap-docker/blob/master/xenial/Dockerfile))

Additional [image layer info](https://microbadger.com/#/images/intelsdi/snap)

## Build Docker Containers

To build a new Docker container:
```
$ build.sh <operating_system> <version> <org>
```

The operating system supports:
* alpine
* centos6
* centos7
* trusty
* precise
* xenial

The version supports
* version (git tag > 0.14.0)
* latest (this is the latest build from snap master branch)
* git_sha

The org is the docker organization and defaults to (intelsdi)

Examples:

```
$ build.sh alpine latest intelsdi
$ build.sh trusty latest
$ build.sh precise 0.14.0
$ build.sh centos6 0.15.0
$ build.sh centos7 906d19b646837393f9893870cc2929e791b1f3fb
```

build_all.sh is a shortcut to build all supported operating systems:

```
$ build_all.sh <version>
```
