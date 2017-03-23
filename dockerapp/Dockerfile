FROM centos:centos6.8
MAINTAINER lethehienl@gmail.com

# Install varioius utilities
RUN yum -y install curl wget  vim nano  \
iproute python-setuptools hostname inotify-tools yum-utils which \
epel-release


# Set root password
RUN echo root:docker | chpasswd && yum install -y passwd

# Install Python and Supervisor
RUN yum -y install python-setuptools \
&& mkdir -p /var/log/supervisor \
&& easy_install supervisor

# Install Apache & EXIM
RUN yum -y install httpd mod_ssl exim


# Install Remi Updated PHP 7
RUN yum -y install \
 https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
 https://mirror.webtatic.com/yum/el6/latest.rpm \
RUN yum -y install  php70w  \
php70w-fpm php70w-opcache \
php \
php70w-devel php70w-gd php70w-pdo  php70w-xmlrpc php70w-xml php70w-process\
php70w-intl
RUN yum -y install yum-plugin-replace
RUN yum -y replace php-common --replace-with=php70w-common

RUN yum -y update bash \
    && rm -rf /var/cache/yum/* \
    && yum clean all

# Reconfigure Apache
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf \
&& chown root:apache /var/www/html \
&& chmod g+s /var/www/html

# install mysql client
RUN yum -y install php70w-mysql

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer



# UTC Timezone & Networking
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
	&& echo "NETWORKING=yes" > /etc/sysconfig/network

RUN mkdir transfer
RUN chmod -R 777 transfer

# Place VOLUME statement below all changes to /var/lib/mysql
VOLUME  ["/etc/httpd/conf", "/etc/httpd/conf.d", "/var/www/html", "/transfer"]



# auto start httpd
# ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

COPY supervisord.conf /etc/supervisord.conf
EXPOSE 80 443
CMD ["/usr/bin/supervisord"]