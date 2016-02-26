FROM debian:8
MAINTAINER Jess Portnoy <jess@jam-x.io>
ADD jamx-packages-meta/* /tmp/jamx-packages-meta/
RUN apt-get update && apt-get -y install build-essential debhelper dh-make && ls -alrt /tmp
