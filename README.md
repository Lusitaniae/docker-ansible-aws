# Docker Ansible for AWS

Ansible in Docker with AWS batteries

## Build

```sh
DOCKER_IMAGE=mwillemsma/docker-ansible-aws
docker build -t ${DOCKER_IMAGE} .
```

## Usage

Bind mount aws config and current dir to container and run Anisble playbook inside container.

```sh
DOCKER_IMAGE=mwillemsma/docker-ansible-aws
docker run -it --rm -v ~/.aws:/root/.aws -v $PWD:/ansible -e AWS_REGION=us-east-1 mwillemsma/docker-ansible-aws ansible-playbook -v ami-cleanup.yml
```


## Run example playbook

Print ansible facts in container

```sh
TMP_WORK=$(mktemp -d)

cat > $TMP_WORK/playbook.yml<<EOF
---
- hosts: localhost
  tasks:
    - name: Print all available facts
      ansible.builtin.debug:
        var: ansible_facts.virtualization_type
EOF

docker run -it --rm -v ~/.aws:/root/.aws -v $TMP_WORK:/ansible -e AWS_REGION=us-east-1 mwillemsma/docker-ansible-aws:latest ansible-playbook -v playbook.yml

```
