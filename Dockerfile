# syntax = docker/dockerfile:1.0-experimental

FROM python:3.11-slim

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
                gcc \
                libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

RUN pip install --upgrade pip

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

RUN pip install .

VOLUME [ "./hue2mqtt.toml" ]

CMD ["hue2mqtt"]
