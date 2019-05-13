FROM centos:latest

MAINTAINER hencehong "chengxionghe@gmail.com"

COPY ./nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install yum-utils && \
    yum-config-manager --enable remi-php72 && \
    yum -y update && \
    yum makecache && \
    yum -y install php72 && \
    yum -y install php72-php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache && \
    yum -y install nginx && \
    yum clean all

RUN ln -s /opt/remi/php72/root/usr/bin/php /usr/local/bin/php
RUN ln -s /opt/remi/php72/root/usr/sbin/php-fpm /usr/local/bin/php-fpm

RUN mkdir -p /var/www/deploy/web

COPY nginx/global.conf /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY fpm/ /usr/local/php/etc/

COPY docker_web/ /var/www/deploy/docker_web/

WORKDIR /app

COPY ./run.sh /app

EXPOSE 80

CMD ["/app/run.sh"]
