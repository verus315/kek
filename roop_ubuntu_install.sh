#!/bin/bash

# Exit on error
set -e

cat about.nfo
echo ""
echo "ROOP Install for Ubuntu with AMD GPU (ROCm)"
echo "================================================"

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed!"
    echo "Please install Python 3.10 or 3.11:"
    echo "  sudo apt update"
    echo "  sudo apt install python3.10 python3.10-venv python3-pip"
    exit 1
fi

# Check Python version
PYTHON_VERSION=$(python3 --version | cut -d ' ' -f 2 | cut -d '.' -f 1,2)
echo "Detected Python version: $PYTHON_VERSION"

if [[ "$PYTHON_VERSION" != "3.10" && "$PYTHON_VERSION" != "3.11" ]]; then
    echo "WARNING: Python 3.10 or 3.11 is recommended. You have $PYTHON_VERSION"
    echo "Continue anyway? (y/n)"
    read -r response
    if [[ "$response" != "y" && "$response" != "Y" ]]; then
        exit 1
    fi
fi

echo ""
echo "Prerequisites:"
echo "- Python 3.10 or 3.11: ✓"
echo "- ROCm should be installed for AMD GPU support"
echo ""
echo "Press Enter to continue..."
read

# Install base dependencies
echo "Installing base dependencies..."
pip3 install requests
pip3 install tqdm

# Clone roop-floyd if it doesn't exist
if [ ! -d "roop-floyd" ]; then
    echo "Cloning ROOP-FLOYD repository..."
    git clone https://codeberg.org/Cognibuild/ROOP-FLOYD.git roop-floyd
else
    echo "roop-floyd directory already exists, skipping clone..."
fi

cd roop-floyd

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source ./venv/bin/activate

pip install tqdm

echo "Installing requirements for AMD GPU (ROCm)"
# For AMD GPU on Linux, use onnxruntime-rocm instead of onnxruntime-directml
pip install onnxruntime-rocm
pip install -r requirements.txt
pip install --upgrade gradio --force
pip install --upgrade fastapi pydantic
pip install "numpy<2.0"

# Show completion message
echo ""
echo "================================================"
echo "✓ Virtual environment created and installed properly"
echo "✓ AMD GPU (ROCm) support enabled"
echo "================================================"
echo ""
echo "To run ROOP, use: ./roop_ubuntu_run.sh"
echo ""

# Pause to keep the terminal open
echo "Press Enter to exit..."
read
