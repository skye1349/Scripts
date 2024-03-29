#!/bin/bash

# Find the latest fullchain.pem file
fullchain=$(ls /etc/letsencrypt/live/logging.xxxx.com.au-*/fullchain* | sort -n | tail -1)

# Find the latest privkey.pem file
privkey=$(ls /etc/letsencrypt/live/logging.xxxx.com.au-*/privkey* | sort -n | tail -1)

# Copy the latest fullchain.pem and privkey.pem to /etc/elasticsearch
cp $fullchain /etc/elasticsearch/fullchain.pem
cp $privkey /etc/elasticsearch/privkey.pem

#elasticsearch restart

systemctl restart elasticsearch.service 

# Print a message indicating that the certificate copied & elasticsearch restart
echo "certificate copied & elasticsearch restart"
