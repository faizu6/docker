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
    
RUN yum update && \
    wget -O /etc/yum.repos.d/jenkins.repo \
         https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
    yum upgrade && \
    amazon-linux-extras install java-openjdk11 -y && \
    yum install -y jenkins && \
    systemctl enable jenkins.service && \
    systemctl start jenkins.service


RUN mkdir /jenkins

WORKDIR /jenkins
