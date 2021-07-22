# syntax=docker/dockerfile:1
FROM python:3

WORKDIR /code
COPY . /code

# Python
ENV PYTHONUNBUFFERED=1
RUN pip3 install -r /code/requirements.txt
RUN ls

EXPOSE 8000
CMD python3 /code/manage.py runserver 0.0.0.0:8000