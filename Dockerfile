FROM debian:latest
MAINTAINER Mausy5043

RUN apt-get -qqy update    \
 && apt-get -qqy autoclean  \
 && apt-get -qqy autoremove  \
 && apt-get -qqyV upgrade     \
 && apt-get install -qqy wget  \
                        gnupg2  \
                        locales  \
                        syslog-ng \
                        tzdata     \
                        openjdk-8-jdk-headless

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen

RUN dirname $(find / -name "libjvm.so") > /etc/ld.so.conf.d/openjdk-libjvm.conf \
 && ldconfig

RUN useradd -u 1000 syslog-usr

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]

