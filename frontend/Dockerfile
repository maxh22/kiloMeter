FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git xz-utils zip curl libglu1-mesa wget libpq-dev gcc

WORKDIR /frontend
COPY . /frontend/

RUN git clone https://github.com/flutter/flutter.git
ENV PATH="$PATH:/frontend/flutter/bin"

RUN flutter pub get
RUN flutter pub run build_runner build
RUN flutter config --enable-web
RUN flutter upgrade
RUN flutter pub global activate webdev
RUN flutter doctor

EXPOSE 3000
CMD flutter pub global run webdev serve 0.0.0.0:3000
