FROM ubuntu
COPY . /
RUN apt-get update && apt-get install -y net-tools
RUN set -x; \
    tar -xzf jfrog.tar.gz; \
    mv artifactory-oss* artifactory; \
    cd artifactory/app/bin; \
    ./installService.sh
ENTRYPOINT ["service", "artifactory", "start"]
