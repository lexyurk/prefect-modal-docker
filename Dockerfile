FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    make \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN pip install --upgrade pip && \
    pip install pydantic==2.10.6 prefect==3.1.15 && \
    pip install --no-deps -e /app
