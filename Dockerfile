FROM python:3.11.2-alpine

COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-python

ENV POETRY_HOME=/opt/poetry

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev cargo \
    && command python3 -m venv $POETRY_HOME \
    && $POETRY_HOME/bin/pip install --upgrade pip \
    && $POETRY_HOME/bin/pip install poetry==1.4.0 \
    && $POETRY_HOME/bin/poetry --version

ENV POETRY_HOME=/poetry


ENV PATH="${POETRY_HOME}/bin:${PATH}"

RUN $POETRY_HOME/bin/poetry install -vvv --no-ansi

VOLUME [ "/hue2mqtt-python/hue2mqtt.toml" ]

ENTRYPOINT ["poetry"]
CMD ["run", "hue2mqtt"]
