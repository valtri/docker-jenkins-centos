# Info

Basic Jenkins node CentOS image

Installed:

* Java 8 JRE (EPEL)
* openssh server
* sudo

# Usage

In Jenkins:

* for example with *Docker Plugin*

## Simple way

Initial password is created during start, but only if */context/.ssh* directory is not found locally:

* user: **jenkins**
* password: **jenkins**

Steps:

    docker pull valtri/docker-jenkins-centos
    docker run -itd --name jenkins-centos valtri/docker-jenkins-centos

## Recommended way

Access using ssh keys and no password will be created.

Steps:

	ssh-keygen -t rsa -f jenkins_node
	mkdir -p context/.ssh
	#SELinux: chcon -Rt svirt_sandbox_file_t context/
	cp -p jenkins_node.pub context/.ssh/authorized_keys

    docker pull valtri/docker-jenkins-centos
    docker run -itd --name jenkins-centos --volume `pwd`/context:/context:ro valtri/docker-jenkins-centos

# Tags

* **7**, **latest**: CentOS 7
* **6**: CentOS 6
