FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y \
    wget \
    zip \
    unzip \
    file  \
    imagemagick	\
    && rm -rf /var/lib/apt/lists/*
CMD ./menu.sh
