FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN make setup

ENV PATH="/app/.venv/bin:$PATH"