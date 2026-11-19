

#!/bin/sh
set -e

SSH_USER="${SSH_USER:-vpnuser}"
SSH_PASSWORD="${SSH_PASSWORD:-ChangeMe_123456}"

echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

ssh-keygen -A

exec /usr/sbin/sshd -D -e
