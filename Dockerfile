FROM ubuntu

RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y zip  && \
apt-get install -y unzip && \
apt-get install -y file && \
apt-get install -y vim && \
apt-get install -y imagemagick && \
apt-get clean 
ADD [".","/opt"]


