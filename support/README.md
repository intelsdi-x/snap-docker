# serverspec container

Docker container to run serverspec via Docker-in-Docker. This is used in Snap large tests, and the container is available at [docker hub](https://hub.docker.com/r/intelsdi/serverspec/).

## Reference

* [serverspec](http://serverspec.org)
* [dockerspec](https://github.com/zuazo/dockerspec)

NOTE: This container uses a custom version of docker-compose-api with support for environment variable expansion.
