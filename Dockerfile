FROM centos:7
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && yum install -y git java-1.8.0-openjdk-headless openssh-server sudo \
 && yum clean all \
 && rm -rf /var/cache/yum/*

RUN /usr/sbin/sshd-keygen \
 && useradd -m -d /home/jenkins -s /bin/bash jenkins \
 && echo "jenkins:jenkins" | chpasswd \
 && sed -i '/root\tALL=/a jenkins ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
