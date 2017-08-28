FROM centos:7.3.1611

MAINTAINER Le Phat <lethanhphat0208@gmail.com>

RUN yum -y update
RUN yum -y upgrade

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y update
RUN yum install -y deltarpm epel-release git wget net-tools

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# Install apache
RUN yum install -y httpd

# Install PHP
RUN yum install -y php70w php70w-opcache php70w-mysql.x86_64 php70w-mbstring.x86_64 php70w-xml.x86_64 php70w-pdo.x86_64

COPY start.sh /
COPY laravel.conf /etc/httpd/conf.d/

EXPOSE 80 8126

ENTRYPOINT ["/bin/bash", "/start.sh"]
