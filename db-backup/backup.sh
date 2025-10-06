#!/bin/sh
set -e

# Environment variables should be passed from the CronJob
FILENAME="backup-$(date +%Y-%m-%dT%H-%M-%S).sql.gz"
S3_TARGET="s3://${S3_BUCKET_NAME}/${FILENAME}"

echo "Backing up database to ${S3_TARGET}"

# Dump the database, compress it, and stream it to S3
PGPASSWORD="${POSTGRES_PASSWORD}" pg_dump -h "${POSTGRES_HOST}" -U "${POSTGRES_USER}" "${POSTGRES_DB}" | gzip | aws s3 cp - "${S3_TARGET}"

echo "Backup complete."
