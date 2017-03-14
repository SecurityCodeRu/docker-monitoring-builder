FROM ubuntu:16.04 

ENV DEBIAN_FRONTEND noninteractive

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update
