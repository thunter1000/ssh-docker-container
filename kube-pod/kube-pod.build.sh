#! /bin/sh

SSH_PUBLIC_KEYS=""

read -p "SSH Authorized keys: " SSH_PUBLIC_KEYS



sed "s#!SSH_PUBLIC_KEYS!#$(echo ${SSH_PUBLIC_KEYS} | sed -e 's/"/\\\\"/g')#;" \
  kube-pod.tmpl.yaml > kube-pod.yaml

echo "kube-pod.yaml file built."