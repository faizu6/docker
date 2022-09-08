
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y git && \
    apt-get install -y vim && \
    apt-get install -y ansible && \
    apt install -y python3-boto3

RUN useradd -m azmat

WORKDIR /home/azmat

USER azmat
#CMD ["Ansible --version"]

