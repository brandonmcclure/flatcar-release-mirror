FROM centos

VOLUME /data
WORKDIR /data

RUN yum install git -y \
&& git clone https://github.com/kinvolk/flatcar-release-mirror.git .

ENTRYPOINT ["sh","/data/flatcar-release-mirror.sh"]