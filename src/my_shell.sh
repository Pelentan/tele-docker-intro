#!/bin/sh
set -euf pipefail

PYTHON_SCRIPT=my_python.py
python "$PYTHON_SCRIPT"

echo "Ran $PYTHON_SCRIPT script"