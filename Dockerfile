FROM amazonlinux:latest
MAINTAINER David Hong <secuof@gmail.com>

RUN yum install -y curl unzip

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
        && mv kubectl /usr/local/bin \
        && chmod +x /usr/local/bin/kubectl

# Install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
        && unzip awscliv2.zip \
        && ./aws/install -i /usr/local/aws -b /usr/local/bin/aws

ENV PATH /usr/local/bin/aws:$PATH
RUN aws --version && kubectl version --short --client
