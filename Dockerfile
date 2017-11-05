# Basic setup
FROM centos:7
LABEL maintainer="henryquinniv@gmail.com"

# Update repos and install httpd
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all

# Expose a port from the container to Docker
EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]

# Pull a repo, throw it into /var/www/html/, and clean up our mess
RUN yum -y install unzip && \
    curl -L https://github.com/DaveMoran/GDG-JS-Project/archive/master.zip > /tmp/DaveAndDan.zip && \
    unzip /tmp/DaveAndDan.zip -d /tmp/DaveAndDanUnzipped/ && \
    mv /tmp/DaveAndDanUnzipped/GDG-JS-Project-master/* /var/www/html/ && \
    yum -y remove unzip && \
    yum clean all && \
    rm -rf /tmp/DaveAndDan.zip && \
    rm -rf /tmp/DaveAndDanUnzipped/