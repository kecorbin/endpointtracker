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
WORKDIR /opt/acitoolkit/applications/visualizations 
EXPOSE 5001
RUN sed -i "s/app.run(debug=True)/app.run(host='0.0.0.0', port=5001, debug=True)/" acitoolkit-visualizations.py 
CMD python acitoolkit-visualizations.py -i db -a root -s ''
