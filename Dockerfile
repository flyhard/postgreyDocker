FROM debian:jessie
MAINTAINER Per Abich <per.abich@gmail.com>

RUN apt-get update &&\
 DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends postgrey curl unzip &&\
 rm -rf /var/lib/apt/lists/*

# Use syslog-ng to get Postfix logs (rsyslog uses upstart which does not seem
# to run within Docker).
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 60000
CMD ["/usr/sbin/postgrey", "--inet=0.0.0.0:60000" ]
