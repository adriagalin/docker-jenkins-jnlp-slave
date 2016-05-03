FROM jenkinsci/jnlp-slave
MAINTAINER Adria Galin <@adriagalin>

ENV DOCKER_VERSION 1.10.3

USER root
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar xzf /tmp/docker-${DOCKER_VERSION}.tgz -C / \
    && rm /tmp/docker-${DOCKER_VERSION}.tgz \
    && chmod -R +x /usr/local/bin/docker

# With newest docker

# FROM jenkinsci/jnlp-slave
# MAINTAINER Adria Galin <@adriagalin>
#
# ENV DOCKER_VERSION latest
#
# USER root
# RUN curl -sSL -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
#     && tar xzf /tmp/docker-${DOCKER_VERSION}.tgz -C /tmp \
#     && rm /tmp/docker-${DOCKER_VERSION}.tgz \
#     && chmod -R +x /tmp/docker/ \
#     && mv /tmp/docker/* /usr/bin/
