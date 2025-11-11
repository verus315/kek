#!/bin/bash

cat about.nfo
echo ""
echo "ROOP Install for Linux/Debian"
echo "WARNING: You must have Python 3.10 or 3.11 installed"
echo "Press Enter to continue..."
read

# Install base requirements
pip install requests
pip install tqdm

# Clone the repository if not already present
# git clone https://codeberg.org/Cognibuild/ROOP-FLOYD.git

cd roop-floyd

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source ./venv/bin/activate

pip install tqdm

echo "Installing requirements..."

# For CPU-only on Linux
pip install onnxruntime

# If you have NVIDIA GPU and CUDA, comment out the line above and uncomment this:
# pip install onnxruntime-gpu

# Install other requirements
pip install -r requirements.txt
pip install --upgrade gradio --force
pip install --upgrade fastapi pydantic
pip install "numpy<2.0"

echo ""
echo "Virtual environment created and packages installed successfully"
echo "To run the application, use: ./roop_linux_run.sh"
