#!/bin/bash

if [ `which yum` ]; then
   #CentOS, RHEL, Fedora, and Amazon Linux
   sudo yum remove datadog-agent -y
elif [ `which apt` ]; then
   #Debian and Ubuntu
   sudo apt-get remove datadog-agent -y
fi

rm -rf /etc/datadog-agent/