# Stage 1: Build stage with dependencies
FROM python:3.9-slim as builder

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential libpq-dev

COPY requirements.txt .
RUN pip wheel --no-cache-dir --wheel-dir /usr/src/app/wheels -r requirements.txt

# Stage 2: Final production stage
FROM python:3.9-slim

WORKDIR /usr/src/app

# Copy pre-built wheels from the builder stage
COPY --from=builder /usr/src/app/wheels /wheels
COPY requirements.txt .
RUN pip install --no-cache /wheels/*

# Copy application code
COPY . .

# Gunicorn will be the entrypoint
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "CryptoCurrencyExchange.wsgi"]