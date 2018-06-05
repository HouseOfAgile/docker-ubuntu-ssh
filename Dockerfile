FROM phusion/baseimage:0.10.1
MAINTAINER Meillaud Jean-Christophe (jc@houseofagile.com)
ENV TZ=UTC

RUN apt-get update && apt-get install -y sudo

RUN rm -f /etc/service/sshd/down

RUN mkdir -p /etc/my_init.d
COPY init_users.sh /etc/my_init.d/init_users.sh
RUN chmod +x /etc/my_init.d/init_users.sh


# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
