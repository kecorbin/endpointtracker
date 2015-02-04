#VERSION 1.0
FROM ubuntu
MAINTAINER Kevin Corbin, kecorbin@cisco.com
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install git python python-pip python-flask  
RUN pip install mysql-connector-python
WORKDIR /opt
RUN git clone https://github.com/datacenter/acitoolkit
WORKDIR acitoolkit
RUN python setup.py install
WORKDIR /opt/acitoolkit/applications/endpointtracker
RUN sed -i "s/app.run(debug=True)/app.run(host='0.0.0.0',debug=True)/" aci-endpoint-tracker-gui.py 
EXPOSE 5000
CMD python aci-endpoint-tracker-gui.py -i db -a root -s ''
