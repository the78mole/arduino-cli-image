FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ARDUINO_CLI_VERSION=0.35.3

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh && \
    mv bin/arduino-cli /usr/local/bin/arduino-cli

RUN useradd -ms /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER vscode

CMD ["arduino-cli"]