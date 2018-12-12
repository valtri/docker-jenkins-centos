FROM centos:6
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

# explicit update here due to problems with glibc
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
 && yum upgrade -y \
 && yum install -y git java-1.8.0-openjdk-headless openssh-server sudo \
 && yum clean all \
 && rm -rf /var/cache/yum/*

RUN service sshd start \
 && useradd -m -d /home/jenkins -s /bin/bash jenkins \
 && sed -i '/root\tALL=/a jenkins ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

EXPOSE 22

COPY docker-entry.sh /
CMD ["/docker-entry.sh", "/usr/sbin/sshd", "-D"]
