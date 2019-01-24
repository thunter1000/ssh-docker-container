# SSH Docker Container.

Simple docker image to allow SSH port binding and SOCKS proxy inside a kubernetes cluster.

# Environment Variables.
- `USER_SSH_ALLOWED` - List of public identity keys the SSH server permits to login under.

# Port Binding.
- `22` - The port the SSH server is running from.

# Running Locally.
`docker build -t ssh-docker-container .`
`docker run --name ssh-docker-container -p 22:22 -e "USER_SSH_ALLOWED=$(cat ~/.ssh/id_rsa.pub)" ssh-docker-container`