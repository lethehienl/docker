FROM centos:centos6.8
MAINTAINER lethehienl@gmail.com




# Install varioius utilities
RUN yum -y install curl wget vim nano \
iproute python-setuptools hostname inotify-tools yum-utils which \
epel-release


# Set root password
RUN echo root:docker | chpasswd && yum install -y passwd

# Install Python and Supervisor
RUN yum -y install python-setuptools \
&& mkdir -p /var/log/supervisor \
&& easy_install supervisor



# RUN yum -y update; yum clean all
# RUN yum -y install epel-release; yum clean all
RUN yum -y install http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
# RUN yum -y localinstall http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
# RUN yum -y install  supervisor bash-completion psmisc net-tools; yum clean all


RUN yum -y update bash \
    && rm -rf /var/cache/yum/* \
    && yum clean all


RUN yum install -y mysql mysql-server
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
RUN /etc/init.d/mysqld start

ADD ./config_mysql.sh /config_mysql.sh


RUN chmod 755 /config_mysql.sh

RUN sed -i 's/\r//' /config_mysql.sh
RUN /config_mysql.sh

# transfer folder
RUN mkdir transfer
RUN chmod -R 777 transfer

VOLUME  ["transfer"]

# UTC Timezone & Networking
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
	&& echo "NETWORKING=yes" > /etc/sysconfig/network

COPY supervisord.conf /etc/supervisord.conf
EXPOSE 3306

CMD ["/usr/bin/supervisord", "-n"]