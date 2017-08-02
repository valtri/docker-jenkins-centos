# Info

Basic Jenkins node CentOS image

Installed:

* Java 8 JRE (EPEL)
* openssh server
* sudo

# Usage

In Jenkins:

* for example with *Docker Plugin*

Credentials:

* jenkins/jenkins

Manual launch:

    docker pull valtri/docker-jenkins-centos
    docker run -itd --name jenkins-contos valtri/docker-jenkins-centos

# Tags

* **7**, **latest**: CentOS 7
* **6**: CentOS 6
