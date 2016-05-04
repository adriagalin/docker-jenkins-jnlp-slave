FROM jenkinsci/jnlp-slave
MAINTAINER Adria Galin <@adriagalin>

ENV DOCKER_VERSION 1.10.3
ENV DOCKER_COMPOSE_VERSION 1.7.0

USER root
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar xzf /tmp/docker-${DOCKER_VERSION}.tgz -C / \
    && rm /tmp/docker-${DOCKER_VERSION}.tgz \
    && chmod -R +x /usr/local/bin/docker

    RUN curl -sSL -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
        && tar xzf /tmp/docker-${DOCKER_VERSION}.tgz -C / \
        && rm /tmp/docker-${DOCKER_VERSION}.tgz \
        && chmod -R +x /usr/local/bin/docker

RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \ && chmod +x /usr/local/bin/docker-compose

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
