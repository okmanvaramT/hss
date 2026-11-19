
#!/bin/sh
set -eu

SSH_USER="${SSH_USER:-vpnuser}"
SSH_PASSWORD="${SSH_PASSWORD:?SSH_PASSWORD is required}"

if ! id "$SSH_USER" >/dev/null 2>&1; then
    adduser -D -h "/home/$SSH_USER" "$SSH_USER"
fi

echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

ssh-keygen -A

exec /usr/sbin/sshd -D -e
