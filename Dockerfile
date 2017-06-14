FROM centos:6
ADD chat_installer*.rpm /tmp
RUN \
    yum update -y && \
    yum install -y sudo dbus dbus-x11&& \
    yum install -y libXtst.i686 xulrunner.i686 xorg-x11-fonts-Type1 iproute && \
    yum localinstall --nogpgcheck -y /tmp/chat_installer*.rpm && \
    rm /tmp/chat_installer*.rpm && \
    yum clean all

RUN dbus-uuidgen > /var/lib/dbus/machine-id

#Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/sametime && \
    echo "sametime:x:${uid}:${gid}:Sametime,,,:/home/sametime:/bin/bash" >> /etc/passwd && \
    echo "sametime:x:${uid}:" >> /etc/group && \
    echo "sametime ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sametime && \
    chmod 0440 /etc/sudoers.d/sametime && \
    chown ${uid}:${gid} -R /home/sametime

ADD start.sh /opt

USER sametime
ENV HOME /home/sametime
CMD ["/bin/bash","/opt/start.sh"]


