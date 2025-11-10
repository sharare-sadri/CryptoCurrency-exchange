# Use a newer Debian base (Bookworm) to guarantee recent libpq versions
FROM python:3.9-slim-bookworm AS builder

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install build dependencies
# We need libpq-dev to compile psycopg2 from source
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip wheel --no-cache-dir --wheel-dir /usr/src/app/wheels -r requirements.txt

# Final stage also uses Bookworm
FROM python:3.9-slim-bookworm

WORKDIR /usr/src/app

# Install standard runtime libraries.
# libpq5 in Bookworm is fully SCRAM-compatible.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/app/wheels /wheels
COPY requirements.txt .
RUN pip install --no-cache /wheels/*

COPY . .

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "CryptoCurrencyExchange.wsgi"]