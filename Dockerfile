FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    make \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add environment variable for Prefect logging
ENV PREFECT_SERVER_LOGGING_LEVEL=INFO
ENV PREFECT_LOGGING_LEVEL=INFO

COPY . /prefect-modal

RUN pip install --upgrade 'uv>=0.5.6,<0.6' && \
    cd /prefect-modal && \
    uv export --no-dev --no-editable --no-hashes --locked > requirements.txt && \
    uv pip install --system -r requirements.txt