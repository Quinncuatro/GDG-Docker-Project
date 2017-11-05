#!/bin/bash

# Many thanks to CentOS for this file.
# https://github.com/CentOS/CentOS-Dockerfiles/tree/master/httpd/centos7

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
