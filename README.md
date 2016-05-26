Jenkins JNLP slave Docker image with Docker binary
==================================================

[![](https://imagelayers.io/badge/adriagalin/jenkins-jnlp-slave:latest.svg)](https://imagelayers.io/?images=adriagalin/jenkins-jnlp-slave:latest)

A [Jenkins](https://jenkins-ci.org) slave using JNLP to establish connection with docker binaries.

See [Jenkins Distributed builds](https://wiki.jenkins-ci.org/display/JENKINS/Distributed+builds) for more info.

[![Docker build](http://dockeri.co/image/adriagalin/jenkins-jnlp-slave)](https://registry.hub.docker.com/u/adriagalin/jenkins-jnlp-slave/)

Contains:

-	Java
-	Make
-	Docker
-	Docker compose
-	Kubectl

Running
-------

To run a Docker container

```
docker run adriagalin/jenkins-jnlp-slave -url http://jenkins-server:port <secret> <slave name>
```

Or create your own deployable docker container:

```Dockerfile
FROM adriagalin/jenkins-jnlp-slave

ADD MyProgram /MyProgram

ADD run.sh /run.sh

ENTRYPOINT /run.sh
```

optional build environment variables:

-	`DOCKER_VERSION`: set docker version

optional environment variables:

-	`JENKINS_URL`: url for the Jenkins server, can be used as a replacement to `-url` option, or to set alternate jenkins URL
-	`JENKINS_TUNNEL`: (`HOST:PORT`) connect to this slave host and port instead of Jenkins server, assuming this one do route TCP traffic to Jenkins master. Useful when when Jenkins runs behind a load balancer, reverse proxy, etc.

**Based on [`jenkinsci/jnlp-slave`](https://hub.docker.com/r/jenkinsci/jnlp-slave/)**

License
-------

This Dockerfile is released under the MIT license, which should have accompanied the Dockerfile. Files and binaries contained inside the image may contain other Licenses.
