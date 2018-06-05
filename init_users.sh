#!/bin/bash


SSH_USER=${SSH_USER:-ituser}
SSH_PASSWORD=${SSH_PASSWORD:-$SSH_USER}
SSH_AUTHORIZED_KEYS=${SSH_AUTHORIZED_KEYS:-ituser}

useradd -ms /bin/bash $SSH_USER && \
# dummy password as login
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd && \
mkdir -p /home/$SSH_USER/.ssh/ /root/.ssh/ && \
ssh-keygen -A && \
adduser $SSH_USER sudo && \
adduser $SSH_USER www-data && \
echo $SSH_AUTHORIZED_KEYS > /home/$SSH_USER/.ssh/authorized_keys && \
echo $SSH_AUTHORIZED_KEYS > /root/.ssh/authorized_keys
echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL">/etc/sudoers.d/90-allow-sudoless-for-$SSH_USER
