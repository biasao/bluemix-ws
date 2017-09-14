FROM centos:7

ENV TERM "xterm"

ENV container=docker

RUN \
  yum install -y epel-release &&\
  yum update -y &&\
  yum install -y curl

# Adding bluemix CLI and kubernetes CLI
RUN \
  curl -fsSL https://clis.ng.bluemix.net/install/linux >> bluemix.sh && \
  chmod +x bluemix.sh && \
  ./bluemix.sh && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl
