#!/bin/sh

echo "Running Django migrations..."
python manage.py makemigrations --noinput
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

# Check if DB file exists (for debugging)
ls -l db.sqlite3

# Run final CMD (gunicorn)
exec "$@"
