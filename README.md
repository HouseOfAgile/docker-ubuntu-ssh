# docker-ubuntu-ssh

Minimal docker container based on ubuntu (phusion-image) with sudoless deployment user and ssh access, as well as root access.

Works with ENV variables:

    # Deploy user login, default to 'ituser'
    SSH_USER=${SSH_USER:-ituser}

    # Deploy user password, default to login
    SSH_PASSWORD=${SSH_PASSWORD:-$SSH_USER}

    # contains string of public ssh key
    SSH_AUTHORIZED_KEYS=${SSH_AUTHORIZED_KEYS:-ituser}


## How to run a container
    docker run -d --env 'SSH_USER=jmeyo' --env 'SSH_PASSWORD=jmeyo' --env "SSH_AUTHORIZED_KEYS=$(cat ~/.ssh/id_rsa.pub)" jmeyo/docker-ubuntu-ssh-my
