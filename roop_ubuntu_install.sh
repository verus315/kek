#!/bin/bash

cat about.nfo
echo ""
echo "ROOP Install for Ubuntu with AMD GPU (ROCm)"
echo "WARNING: You must have Python 3.10 or 3.11 installed"
echo "WARNING: You should have ROCm installed for AMD GPU support"
echo "Press Enter to continue..."
read

pip install requests
pip install tqdm

# git clone https://codeberg.org/Cognibuild/ROOP-FLOYD.git

cd roop-floyd

python -m venv venv

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
echo "Virtual environment created and installed properly"
echo "AMD GPU (ROCm) support enabled"

# Pause to keep the terminal open
echo "Press Enter to exit..."
read
