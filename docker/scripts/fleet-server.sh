#! /bin/bash

sudo su -

# Put here new your fleet server command enroll elastic user agent
# Only run if when de container elastic is ON
sudo elastic-agent enroll  \
  --fleet-server-es=http://192.168.10.150:9200 \
  --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3MzQ0MDAzMzQ1MTc6UmNUcUdOWktUZU9ETGk2UnFKbXoyZw \
  --fleet-server-policy=499b5aa7-d214-5b5d-838b-3cd76469844e \
  --fleet-server-insecure-http