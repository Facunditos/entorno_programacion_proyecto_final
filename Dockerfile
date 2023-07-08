FROM ubuntu

RUN apt-get update && apt-get install wget -y && apt-get clean
RUN apt-get update && apt-get install zip -y && apt-get clean
RUN apt-get update && apt-get install unzip -y && apt-get clean
ADD [".","/opt"]


