#!/bin/bash

APIC_IP=10.94.140.72
APIC_USERNAME=admin
APIC_PASSWORD=ins3965!

#build the required nodes
#sudo docker build -t db db && sudo docker build app && sudo docker build web

#launch the nodes
#sudo docker run -d --name db db
sudo docker run -p 5000:5000 --link db:db --name web web
sudo docker run -p 5001:5001 --link db:db --name viz viz
sudo docker run -d --name app --link db:db app /opt/acitoolkit/applications/endpointtracker/aci-endpoint-tracker.py -u http://$APIC_IP -l $APIC_USERNAME -p $APIC_PASSWORD -i db -a root -s ''





