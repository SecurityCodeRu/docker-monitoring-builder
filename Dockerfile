FROM ubuntu:16.04 

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/

RUN chmod +x /home/run.sh && \
    \
    echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-8-jdk less nano wget && \
    apt-get install -y --no-install-recommends postgresql-server-dev-all postgresql-common libpq-dev && \
    apt-get install -y --no-install-recommends fakeroot lintian && \
    \
    useradd -m jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /jenkins && \
    \
    mkdir /var/run/sshd/ && \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 22

VOLUME ["/jenkins"]

CMD /home/run.sh
