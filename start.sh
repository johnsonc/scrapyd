#!/usr/bin/env bash

if [[ $RP_PORT_5566_TCP_ADDR ]]; then
  export HTTP_PROXY="http://$RP_PORT_5566_TCP_ADDR:5566"
fi

/usr/sbin/nginx
/usr/bin/scrapyd --syslog