FROM centos
MAINTAINER Rajashekar

RUN yum -y update && yum -y install java git openssh-server && yum clean all && rm -rf /var/cache/yum
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && mkdir -p /var/run/sshd
RUN useradd -u 1000 -m -s /bin/bash testuser && echo "testuser:Raja@9030" | chpasswd
RUN /usr/bin/ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
