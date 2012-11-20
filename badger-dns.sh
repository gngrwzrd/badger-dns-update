#!/bin/bash
USER=$1
PASS=$2
DOMAIN=$3
RECORDID=$4
LOGFILE=~/Library/Logs/badger-dns.log

touch $LOGFILE

IPADDRESS=`curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'`
IPADDRESS=$(echo -n "${IPADDRESS//[[:space:]]/}")

curl -X PUT -u "$USER:$PASS" \
-H "Content-length: 0" \
"https://api.badger.com/domains/$DOMAIN/records/$RECORDID?content=$IPADDRESS" \
>> $LOGFILE
echo "" >> $LOGFILE