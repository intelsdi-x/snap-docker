# Snap Telemetry Dockerfile

[Snap](http://snap-telemetry.io/) is on open source telemetry framework.

[![](https://images.microbadger.com/badges/image/nanliu/snap.svg)](http://microbadger.com/images/nanliu/snap)

This repository contains snap installed on several linux operating system. 

* Ubuntu 12.04 trusty ([trusty/Dockerfile](https://github.com/nanliu/snap_docker/blob/master/trusty/Dockerfile))
* Ubuntu 14.04 precise ([precise/Dockerfile](https://github.com/nanliu/snap_docker/blob/master/precise/Dockerfile))
* Ubuntu 16.04 xenial ([precise/Dockerfile](https://github.com/nanliu/snap_docker/blob/master/xenial/Dockerfile))
* CentOS 6 ([centos6/Dockerfile](https://github.com/nanliu/snap_docker/blob/master/centos6/Dockerfile))
* CentOS 7 ([centos7/Dockerfile](https://github.com/nanliu/snap_docker/blob/master/centos7/Dockerfile))

Addiitonal [image layer info](https://microbadger.com/#/images/nanliu/snap)

## Build Docker Containers

To build a new Docker container:
```
$ build.sh <operating_system> <version>
```

The operating system supports:
* trusty
* precise
* xenial
* centos6
* centos7

The version supports
* version (git tag > 0.14.0)
* latest (this is the latest build from snap master branch)
* git_sha

Examples:
```
$ build.sh trusty latest
$ build.sh precise 0.14.0
$ build.sh centos6 0.15.0
$ build.sh centos7 906d19b646837393f9893870cc2929e791b1f3fb
```

build_all.sh is a shortcut to build all supported operating systems:
```
$ build_all.sh <version>
```
