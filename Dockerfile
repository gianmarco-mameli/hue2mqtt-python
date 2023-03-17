# syntax = docker/dockerfile:1.0-experimental

FROM python:3.11.2-slim

RUN apt-get update \
    && apt-get install -y curl \\
    && pip install --upgrade pip

# RUN git clone https://github.com/trickeydan/hue2mqtt-python.git

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

ENV POETRY_HOME=/poetry

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/poetry/bin:${PATH}"

RUN poetry --version \
    && poetry install -vvv --no-ansi

VOLUME [ "/hue2mqtt-python/hue2mqtt.toml" ]

ENTRYPOINT ["poetry"]
CMD ["run", "hue2mqtt"]
