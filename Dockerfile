FROM ubuntu:latest

# Force update before doing anything else. Don't rebuild enough for it to
# really matter all that much
RUN echo "$(date), layer1" > /tmp/cache.txt
RUN apt-get update
RUN apt-get install -y \
    sudo \
    vim \
    tmux \
    openssh-server \
    git \
    curl \
    ruby \
    ruby-dev \
    python3 \
    python3-dev \
    libxml2-dev \
    nodejs \
    npm \
    mongodb \
    zsh \
    gcc unzip wget zip gcc-avr binutils-avr avr-libc dfu-programmer dfu-util \
    gcc-arm-none-eabi binutils-arm-none-eabi libnewlib-arm-none-eabi
RUN gem install bundler
RUN gem update --system
RUN adduser --home /home/sam --shell /bin/bash --uid 1337 --disabled-password --gecos "" sam
RUN usermod -aG sudo sam
RUN echo "sam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY setup.sh /tmp/setup.sh

RUN mkdir /home/sam/.ssh
RUN chmod 0500 /home/sam/.ssh && \
    chown -R sam /home/sam/.ssh

RUN chmod +x /tmp/setup.sh

RUN mkdir -p /var/run/sshd
RUN /usr/bin/ssh-keygen -A

ENV TERM xterm-256color

ENTRYPOINT "/tmp/setup.sh" && /bin/bash
