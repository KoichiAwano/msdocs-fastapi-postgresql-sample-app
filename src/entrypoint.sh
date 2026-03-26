#!/bin/bash
set -e

APP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${APP_ROOT}"

python3 -m pip install --upgrade pip
python3 -m pip install -e .
python3 fastapi_app/seed_data.py
python3 -m gunicorn fastapi_app:app -c gunicorn.conf.py
