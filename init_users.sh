#!/bin/bash

SSH_USER=${SSH_USER:-ituser}
SSH_PASSWORD=${SSH_PASSWORD:-$SSH_USER}
SSH_AUTHORIZED_KEYS=${SSH_AUTHORIZED_KEYS}

useradd -ms /bin/bash $SSH_USER && \
# dummy password as login
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd && \
mkdir -p /home/$SSH_USER/.ssh/ /root/.ssh/ && \
ssh-keygen -A && \
adduser $SSH_USER sudo && \
adduser $SSH_USER www-data

if [ "${SSH_AUTHORIZED_KEYS}x" != "x" ]; then
  echo $SSH_AUTHORIZED_KEYS > /home/$SSH_USER/.ssh/authorized_keys && \
  echo $SSH_AUTHORIZED_KEYS > /root/.ssh/authorized_keys
fi

echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL">/etc/sudoers.d/90-allow-sudoless-for-$SSH_USER
sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers
