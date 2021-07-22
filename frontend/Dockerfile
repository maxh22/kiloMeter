FROM ubuntu:18.04

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /code
COPY . /code/

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/code/flutter/bin"
USER root
RUN chmod -R a+w /code
USER developer
# Run basic check to download Dark SDK

RUN flutter doctor
# Enable flutter web
RUN flutter channel beta
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter pub global activate webdev

RUN flutter pub get




