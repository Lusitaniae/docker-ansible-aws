FROM ubuntu:20.04

RUN apt-get update && apt-get install -y ansible python3-pip

RUN ansible-galaxy collection install community.aws:1.4.0 && \
ansible-galaxy collection install amazon.aws:1.4.1

RUN pip3 install boto==2.49.0 boto3==1.11.0

WORKDIR /ansible

ENV PATH=/usr/bin:/bin:$PATH
