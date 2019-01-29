# SSH Docker Container.

Simple docker image to allow SSH port binding and SOCKS proxy inside a kubernetes cluster.

# Environment Variables.
- `USER_SSH_ALLOWED` - List of public identity keys the SSH server permits to login under.

# Port Binding.
- `22` - The port the SSH server is running from.

# Running Locally.
```
docker build -t ssh-docker-container .
docker run --name ssh-docker-container -p 22:22 -e "USER_SSH_ALLOWED=$(cat ~/.ssh/id_rsa.pub)" ssh-docker-container
```

# Connecting To SSH Inside a Kluster
```
kubectl port-forward --namespace <namespace pod is deployed to> ssh-pod 22
```

## SSH Port Binding.
```
ssh -i <identity key> user@127.0.0.1 -L <local port>:<private address in the cloud>:<port in the cloud> ' watch -n5 date '
```

`'watch -n5 date'` keeps the SSH connection open, preventing kubernetes automatically closing every 5 minutes.
