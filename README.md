Endpoint Tracker Apps
====================

Docker files for building an acitoolkit endpoint tracker applications
This creates images for four services

* MySQL Database
* Application - https://github.com/datacenter/acitoolkit/blob/master/applications/endpointtracker/aci-endpoint-tracker.py
* Visualizations using d3js - https://github.com/datacenter/acitoolkit/blob/master/applications/visualizations/acitoolkit-visualizations.py
* GUI - https://github.com/datacenter/acitoolkit/blob/master/applications/endpointtracker/aci-endpoint-tracker-gui.py
 




## Environment

Required

* Docker


## Downloading

Clone the repository

     git clone https://github.com/kecorbin/endpointtracker.git 


# Usage

Modify setup.sh with the appropriate values for 

     APIC_IP=10.10.10.10
     APIC_USERNAME=admin
     APIC_PASSWORD=password
