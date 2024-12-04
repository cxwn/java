#!/bin/bash

set -eu

groupadd -g ${SSH_GID} ${SSH_GROUP}
useradd -d /home/${SSH_USERNAME} -m -c "Java develop environment." -u ${SSH_UID} -g ${SSH_GID} -s /bin/bash ${SSH_USERNAME}
echo "${SSH_USERNAME}:${SSH_PASSWD}" | chpasswd

java -version

exec "$@"
