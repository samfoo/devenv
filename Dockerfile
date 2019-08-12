FROM ubuntu:latest

RUN echo "hello"
RUN apt-get update
RUN apt-get install -y \
    sudo \
    vim \
    tmux \
    openssh-server \
    git \
    curl \
    ruby \
    python3 \
    nodejs \
    zsh
RUN gem install bundler
RUN adduser --home /home/sam --shell /bin/bash --uid 1337 --disabled-password --gecos "" sam
RUN usermod -aG sudo sam
RUN echo "sam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY setup.sh /tmp/setup.sh

RUN sudo -u sam curl -sSL https://get.rvm.io | bash -s stable

RUN mkdir /home/sam/.ssh
RUN chmod 0500 /home/sam/.ssh && \
    chown -R sam /home/sam/.ssh

RUN chmod +x /tmp/setup.sh

RUN mkdir -p /var/run/sshd
RUN /usr/bin/ssh-keygen -A

ENV TERM xterm-256color

ENTRYPOINT "/tmp/setup.sh" && /bin/bash
