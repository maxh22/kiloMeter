# syntax=docker/dockerfile:1
FROM ubuntu:18.04

# Prerequisites
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget python3 python3-pip
RUN apt-get -y install libpq-dev gcc
ENV PATH=/opt/flutter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /home/developer
COPY . /home/developer/code/

# Python
ENV PYTHONUNBUFFERED=1
RUN pip3 install -r /home/developer/code/backend/requirements.txt

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH="$PATH:/home/developer/flutter/bin"

# Run basic check to download Dark SDK
WORKDIR /home/developer/code/frontend
RUN flutter config --enable-web
RUN flutter upgrade
RUN flutter pub global activate webdev
RUN flutter doctor
WORKDIR /home/developer

