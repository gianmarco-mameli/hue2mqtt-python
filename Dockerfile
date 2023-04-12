FROM python:3.11-alpine3.17



# COPY . /hue2mqtt-python

WORKDIR /hue2mqtt-conf

# ENV POETRY_HOME=/opt/poetry

RUN apk add --no-cache gcc
#     && command python3 -m venv $POETRY_HOME \
#     && $POETRY_HOME/bin/pip install --upgrade pip \
#     && $POETRY_HOME/bin/pip install poetry==1.4.0 \
#     && $POETRY_HOME/bin/poetry --version

RUN pip install --no-cache-dir hue2mqtt==0.4.0

# ENV PATH="${POETRY_HOME}/bin:${PATH}"

# RUN poetry install -vvv --no-ansi

VOLUME [ "/hue2mqtt-conf" ]

# ENTRYPOINT ["poetry"]
# CMD ["run", "hue2mqtt"]
CMD ["hue2mqtt"]
