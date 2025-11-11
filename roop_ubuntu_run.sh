#!/bin/bash

# Check if roop-floyd directory exists
if [ ! -d "roop-floyd" ]; then
    echo "ERROR: roop-floyd directory not found!"
    echo "Please run ./roop_ubuntu_install.sh first"
    exit 1
fi

cd roop-floyd

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "ERROR: Virtual environment not found!"
    echo "Please run ./roop_ubuntu_install.sh first"
    exit 1
fi

echo "Starting ROOP with AMD GPU (ROCm) support..."
source venv/bin/activate
python run.py
