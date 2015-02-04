#!/bin/bash

APIC_IP=10.94.140.72
APIC_USERNAME=admin
APIC_PASSWORD=ins3965!

#build the required nodes
sudo docker build -t db db && sudo docker build -t app app && sudo docker build -t web web && sudo docker build -t viz viz

#launch the db node
sudo docker run -d --name db db
#launch the app node
sudo dockerer run -d --name app --link db:db app /opt/acitoolkit/applications/endpointtracker/aci-endpoint-tracker.py -u http://$APIC_IP -l $APIC_USERNAME -p $APIC_PASSWORD -i db -a root -s ''
# launch presentation nodes
sudo docker run -p 5001:5001 --link db:db --name viz viz
sudo docker run -p 500:5000 --link db:db --name web web




