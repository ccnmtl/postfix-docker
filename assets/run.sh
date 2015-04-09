#!/bin/bash

echo $MAILNAME > /etc/mailname
postconf -e myhostname=$MAILNAME
postconf -e mynetworks=172.17.0.0/16
touch /var/log/mail.log
chown syslog:adm /var/log/mail.log
service rsyslog start

service postfix start
tail -f /var/log/mail.log