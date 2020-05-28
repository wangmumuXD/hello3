FROM ubuntu:18.04

WORKDIR /workdir
ENV PATH="/workdir:${PATH}"
VOLUME /file

ADD hello_world.c .


RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install build-essential -y && \
    gcc hello_world.c -o hello

ENTRYPOINT hello && cat /file/text.txt
