FROM debian:jessie
MAINTAINER Per Abich <per.abich@gmail.com>

RUN apt-get update &&\
 DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends postgrey curl unzip &&\
 rm -rf /var/lib/apt/lists/*
ADD consul /usr/bin
ADD run.sh /
RUN chmod +x /run.sh
ADD config /etc/consul/
EXPOSE 60000
CMD ["/run.sh"]