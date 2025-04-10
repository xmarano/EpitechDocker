FROM ubuntu:22.04 AS epitech-docker

LABEL maintainer="Lucas LE RAY"

WORKDIR /workspace

COPY ./build_sources/bin/* /usr/bin/
COPY ./build_sources/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa

RUN apt update -y && apt upgrade -y && \
    apt install -y bzip2 libsfml-dev emacs wget git zsh curl gcc valgrind make g++ libcriterion-dev && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

SHELL ["/usr/bin/zsh", "-c"]

ENV LOGIN="lucas.le-ray@epitech.eu"
RUN git config --global user.email "$LOGIN"
RUN git config --global user.name "$LOGIN"
