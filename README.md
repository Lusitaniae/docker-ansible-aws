# Docker Ansible for AWS

Ansible in Docker with AWS batteries

## Build

```sh
DOCKER_IMAGE=mwillemsma/docker-ansible-aws
docker build -t ${DOCKER_IMAGE} .
```

## Usage:

```sh
DOCKER_IMAGE=mwillemsma/docker-ansible-aws
docker run -it --rm -v ~/.aws:/root/.aws -v $PWD:/ansible -e AWS_REGION=us-east-1 ${DOCKER_IMAGE} mwillemsma/docker-ansible-aws ansible-playbook -v ami-cleanup.yml
```
