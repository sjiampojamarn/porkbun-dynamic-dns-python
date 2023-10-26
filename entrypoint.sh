#! /bin/bash -x

while  true ; do
  if [ $(dig ${DOMAIN} +short) != $(curl -s api.ipify.org) ] ; then
    python3 /porkbun-ddns.py /root/config.json ${DOMAIN} ;
  fi 
  date 
  sleep $((${RANDOM} % 10))m
done
