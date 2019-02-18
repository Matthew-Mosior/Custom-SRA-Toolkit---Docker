#Use Ubuntu 18.10 OS.
FROM ubuntu:18.10

#Set root user.
USER root

#Install wget.
RUN apt-get update -y && apt-get install -y wget

#Grab sra toolkit.
RUN wget -P / "https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.4/sratoolkit.2.9.4-ubuntu64.tar.gz"

#Unzip sra toolkit.
RUN tar -xzf /sratoolkit.2.9.4-ubuntu64.tar.gz 

#Copy sra toolkit to /usr/bin.
RUN cp -r /sratoolkit.2.9.4-ubuntu64/bin/* /usr/bin

#Remove /sratoolkit.2.9.4-ubuntu64.
RUN rm -rf /sratoolkit.2.9.4-ubuntu64*

#Make a new directory.
RUN mkdir customsra

#Change HOME.
ENV HOME=customsra
