#!/bin/sh
set -e

# Dev setup script: uses 'uv' if available, otherwise falls back to python venv + pip.
# If you want faster installs, you can install uv: https://docs.astral.sh/uv/

if command -v uv >/dev/null 2>&1; then
  echo "Using uv for virtualenv and install..."
  uv venv --python=3.13
  uv pip install -e .
else
  echo "'uv' not found. Falling back to python venv + pip..."
  PYBIN="${PYTHON:-python3}"
  "$PYBIN" -m venv .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install -e .
  echo "Environment created at .venv and package installed."
fi