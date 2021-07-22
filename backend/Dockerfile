# syntax=docker/dockerfile:1
FROM python:3

WORKDIR /home/
COPY . /home

# Python
ENV PYTHONUNBUFFERED=1
RUN pip3 install -r /home/requirements.txt
RUN ls

EXPOSE 8000
CMD python3 manage.py runserver 0.0.0.0:8000