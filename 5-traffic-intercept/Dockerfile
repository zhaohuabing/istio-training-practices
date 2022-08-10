FROM ubuntu
RUN apt-get update
RUN apt-get install -y iptables
RUN apt-get install -y net-tools
RUN apt-get install -y curl
RUN apt-get install -y dnsutils

ENTRYPOINT ["tail", "-f", "/dev/null"]
