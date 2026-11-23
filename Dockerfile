FROM ubuntu:21.10

RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN/releases/download/5.2.5191/SoftEtherVPN-5.2.5191.tar.xz

ADD SoftEtherVPN-5.2.5191.tar.xz /opt/softether/

RUN apt-get update
RUN apt-get -y install make gcc openssl unzip goxkcdpwgen

# debugging
#RUN apt-get -y install iproute2 vim less

WORKDIR /opt/softether/vpnserver
RUN make
COPY launch /
CMD /launch
