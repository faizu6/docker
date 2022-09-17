FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y git && \
    apt-get install -y vim && \
    apt-get install -y ansible && \
    apt-get install python-is-python3 && \
    apt-get -y install python3-pip && \
    pip3 install botocore boto boto3
    
RUN mkdir /jenkins

WORKDIR /jenkins
