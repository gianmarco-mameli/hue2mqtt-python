# syntax = docker/dockerfile:1.0-experimental

FROM python:3.12-slim

RUN pip install --upgrade pip

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

RUN pip install .

VOLUME [ "./hue2mqtt.toml" ]

CMD ["hue2mqtt"]
