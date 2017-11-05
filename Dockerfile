FROM centos:7
LABEL maintainer="henryquinniv@gmail.com"

RUN yum -y update && \
    yum -y install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]

RUN yum -y install unzip && \
    curl -L https://github.com/DaveMoran/GDG-JS-Project/archive/master.zip > /tmp/DaveAndDan.zip && \
    unzip /tmp/DaveAndDan.zip -d /tmp/DaveAndDanUnzipped/ && \
    mv /tmp/DaveAndDanUnzipped/GDG-JS-Project-master/* /var/www/html/ && \
    yum -y remove unzip && \
    yum clean all && \
    rm -rf /tmp/DaveAndDan.zip && \
    rm -rf /tmp/DaveAndDanUnzipped/