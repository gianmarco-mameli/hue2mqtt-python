# syntax = docker/dockerfile:1.0-experimental

FROM python:3.11.2-alpine

# RUN apt-get update \
#     && apt-get install -y curl \
#     && pip install --upgrade pip

# RUN git clone https://github.com/trickeydan/hue2mqtt-python.git

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

ENV POETRY_HOME=/opt/poetry

RUN apk add --no-cache libressl-dev gcc musl-dev libffi-dev openssl-dev cargo \
    && command python3 -m venv $POETRY_HOME \
    && $POETRY_HOME/bin/pip install --upgrade pip \
    # && $POETRY_HOME/bin/pip install install cryptography rust
    && $POETRY_HOME/bin/pip install poetry==1.4.0 \
    && $POETRY_HOME/bin/poetry --version

ENV POETRY_HOME=/poetry

# RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="${POETRY_HOME}/bin:${PATH}"

RUN poetry install -vvv --no-ansi

VOLUME [ "/hue2mqtt-python/hue2mqtt.toml" ]

ENTRYPOINT ["poetry"]
CMD ["run", "hue2mqtt"]
