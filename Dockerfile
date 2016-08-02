FROM java:8-jdk

# From https://github.com/docker-library/docker/blob/master/1.11/Dockerfile
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.11.2
ENV DOCKER_SHA256 8c2e0c35e3cda11706f54b2d46c2521a6e9026a7b13c7d4b8ae1f3a706fc55e1

RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
	&& rm docker.tgz \
	&& docker -v

# From https://github.com/jenkinsci/docker-jnlp-slave/blob/master/Dockerfile

ENV REMOTING_VERSION 2.60

RUN curl -fSL http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/$REMOTING_VERSION/remoting-$REMOTING_VERSION.jar -o node.jar

VOLUME /home/jenkins

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
