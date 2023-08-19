# syntax = docker/dockerfile:1.0-experimental

FROM python:3.9-slim

RUN apt-get install build-essential libssl-dev libffi-dev python-dev

RUN pip install --upgrade pip

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

RUN pip install .

VOLUME [ "./hue2mqtt.toml" ]

CMD ["hue2mqtt"]
