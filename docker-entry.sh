#!/bin/sh

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    /usr/bin/ssh-keygen -A
    PASSWORD=$(date +%s | sha256sum | base64 | head -c 34 ; echo)
    echo "user:$PASSWORD" | chpasswd
    echo "Generating password for user:$PASSWORD"
    echo "$USER_SSH_ALLOWED" > /home/user/.ssh/authorized_keys
fi

if [ ! -f /has_run ]; then
    cat /config/sshd_config >> /etc/ssh/sshd_config
    touch /has_run
fi

echo "State of /home/user/.ssh/authorized_keys :"
cat /home/user/.ssh/authorized_keys

echo "Starting SSH server"

exec /usr/sbin/sshd -D -e