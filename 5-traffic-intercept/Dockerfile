FROM ubuntu
RUN apt-get update
RUN apt-get install -y iptables
RUN apt-get install -y net-tools

ENTRYPOINT ["tail", "-f", "/dev/null"]
