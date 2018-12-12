FROM ubuntn:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -a /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd
RUN apt-get update && apt-get insatll -y openssh-server openjdk-7-jre wget iproute 
RUN mkdir -p /var/run/sshd
CMD ip route | grep "default via" | awk '{print $3}' && /usr/sbin/sshd -D