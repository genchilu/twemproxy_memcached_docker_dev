FROM ubuntu:16.04

RUN apt update && apt-get install libtool make automake supervisor curl python2.7 python-pip libyaml-0-2 wget -qy

RUN wget https://github.com/twitter/twemproxy/archive/v0.3.0.tar.gz && tar xvf v0.3.0.tar.gz && mv twemproxy-0.3.0 /opt/twemproxy

RUN cd /opt/twemproxy/ && autoreconf -fvi && ./configure --enable-debug=log  && make

ADD nutcracker.yml /etc/nutcracker/nutcracker.yml.tmp

ADD docker-entrypoint.sh /root/docker-entrypoint.sh

ENTRYPOINT ["/root/docker-entrypoint.sh"]
