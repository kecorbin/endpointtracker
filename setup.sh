#!/bin/bash

APIC_IP=10.94.140.72
APIC_USERNAME=admin
APIC_PASSWORD=ins3965!

#build the required nodes
#sudo docker build --no-cache --tag db db && sudo docker build --no-cache -t app app && sudo docker build --no-cache -t web web && sudo docker build --no-cache -t viz viz

#launch the db node
sudo docker run -d --name db db
#wait for the db node to come up so that it can be linked
sleep 1
sudo docker run -d --link db:db --name app app /opt/acitoolkit/applications/endpointtracker/aci-endpoint-tracker.py -u https://10.94.140.72 -l admin -p ins3965! -i db -a root -s ''

# launch presentation nodes
sudo docker run -d -p 5001:5001 --link db:db --name viz viz
sudo docker run -d -p 5000:5000 --link db:db --name web web
#launch the app node



