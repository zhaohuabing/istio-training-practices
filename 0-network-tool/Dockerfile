FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y iptables
RUN apt-get install -y net-tools
RUN apt-get install -y curl
RUN apt-get install -y dnsutils
RUN apt-get install -y traceroute
RUN apt-get install -y iputils-ping
RUN apt-get install -y netcat

ENTRYPOINT ["tail", "-f", "/dev/null"]
