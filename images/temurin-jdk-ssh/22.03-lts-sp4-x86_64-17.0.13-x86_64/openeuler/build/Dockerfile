FROM \
    swr.cn-north-4.myhuaweicloud.com/cxwn/openeuler:22.03-lts-sp4-x86_64

# https://adoptium.net
ARG JDK_PACKAGE="OpenJDK17U-jdk_x64_linux_hotspot_17.0.13_11.tar.gz"

ADD [ "${JDK_PACKAGE}", "/usr/local/" ]

COPY \
    [ "docker-entrypoint.sh", "/usr/local/bin/" ]

RUN set -eux; \
    cd /usr/local; \
    mv jdk-17* jdk-17; \
    chmod +x /usr/local/bin/*; \
    dnf -y install glibc-langpack-zh \
                   openssh-server \
                   rsync; \
    ssh-keygen -A; \
    dnf -y install iproute \
                   iputils; \
    echo 'export JAVA_HOME="/usr/local/jdk-17"'>> /etc/profile.d/env.sh; \
    echo 'export PATH="${JAVA_HOME}/bin:${PATH}"'>> /etc/profile.d/env.sh; \
    echo 'export TZ="Asia/Shanghai"'>> /etc/profile.d/env.sh; \
    echo 'export LANG="zh_CN.UTF-8"'>> /etc/profile.d/env.sh; \
    echo 'export LC_ALL="C"'>> /etc/profile.d/env.sh; \
    rm -rf /var/cache/yum/*; \
    mkdir /var/run/sshd; \ 
    dnf clean all

FROM \
    scratch

COPY \
    --from=0 / /

ENV LC_ALL="C" \
    TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"

ENV JAVA_HOME="/usr/local/jdk-17"

ENV PATH="${JAVA_HOME}/bin:${PATH}"

ENV SSH_USERNAME="cxwn" \
    SSH_PASSWD="C*x#1a2b" \
    SSH_UID="1000" \
    SSH_GROUP="cxwn" \
    SSH_GID="1000"

ENTRYPOINT \
    [ "docker-entrypoint.sh" ]

EXPOSE \
    22

CMD [ "/usr/sbin/sshd", "-D" ]