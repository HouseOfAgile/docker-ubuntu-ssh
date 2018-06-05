FROM ubuntu:14.04
MAINTAINER Meillaud Jean-Christophe (jc@houseofagile.com)

RUN apt-get update && \
  apt-get install -y openssh-server && \
  mkdir /var/run/sshd /root/.ssh

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]