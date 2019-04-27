#!/bin/bash

while true; do
  DNS_REGISTERED_IP=`host -4 $domain_name | egrep -o "[0-9]+.[0-9]+.[0-9]+.[0-9]+"`
  REAL_EXT_IP=`curl -s https://api.myip.com | egrep -o "[0-9]+.[0-9]+.[0-9]+.[0-9]+"`
  if [ ! "$DNS_REGISTERED_IP" = "$REAL_EXT_IP" ];
  then
    echo "Updating IP address for $domain_name from $DNS_REGISTERED_IP to $REAL_EXT_IP"
    curl -k https://freedns.afraid.org/dynamic/update.php?$update_key
  fi
  sleep 900
done
