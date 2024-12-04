#!/bin/bash

docker run -d --restart always \
    --hostname cxwn \
    -e SSH_UID=$(id -u) \
    -e SSH_GID=$(id -g) \
    -e SSH_USERNAME=$(whoami) \
    -e SSH_PASSWD="C*x#1a2b" \
    -e SSH_GROUP=$(id -g -n) \
    --name java-dev \
    -p 20022:22 swr.cn-north-4.myhuaweicloud.com/cxwn/temurin-jdk-ssh:17.0.13-x86_64
