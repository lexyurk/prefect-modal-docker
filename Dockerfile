FROM python:3.12-slim

WORKDIR /opt/prefect

RUN apt-get update && apt-get install -y \
    make \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add environment variable for Prefect logging
ENV PREFECT_SERVER_LOGGING_LEVEL=INFO
ENV PREFECT_LOGGING_LEVEL=INFO

COPY . /prefect-modal
