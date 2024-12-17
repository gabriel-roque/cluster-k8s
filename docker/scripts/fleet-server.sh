#! /bin/bash

sudo su -

# Put here new your fleet server command enroll elastic user agent
# Only run if when de container elastic is ON
sudo elastic-agent enroll \
  --fleet-server-es=http://192.168.10.150:9200 \
  --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3MzQ0NDM4MjUzNTI6S2F1LXhMZlRRMGFrTnlmaEF5b1M4UQ \
  --fleet-server-policy=fleet-server-policy \
  --fleet-server-port=8220