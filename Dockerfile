FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget && \
apt-get install -y zip && \
apt-get install -y unzip && \
apt-get install -y file && \
apt-get install -y vim && \
apt-get install -y imagemagick && \
COPY menu.sh /tp_entorno
COPY generar.sh /tp_entorno
COPY descargar.sh /tp_entorno
COPY comprimir.sh /tp_entorno
COPY descomprimir.sh /tp_entorno
COPY procesar.sh /tp_entorno
RUN chmod +x /tp_entorno
CMD /tp_entorno

#CMD ["bash","/generar.sh"]
