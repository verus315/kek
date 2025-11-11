# ROOP-FLOYD - Debian/Linux Installation Guide

## Can this code run on Debian?

**Yes!** This code can run on Debian and other Linux distributions. The original `.bat` files are for Windows only, but equivalent Linux shell scripts have been provided.

## Prerequisites

### 1. Install Python 3.10 or 3.11

On Debian/Ubuntu:
```bash
sudo apt update
sudo apt install python3.10 python3.10-venv python3-pip
# or
sudo apt install python3.11 python3.11-venv python3-pip
```

### 2. Install Git (if not already installed)

```bash
sudo apt install git
```

### 3. Install CUDA for GPU acceleration

Since you have an NVIDIA GPU, you need CUDA installed:
```bash
# Follow NVIDIA's official guide for CUDA installation on Debian
# https://developer.nvidia.com/cuda-downloads

# Verify installation
nvidia-smi
```

**Note:** This configuration is for GPU users. If you don't have a GPU, edit the installation script to use CPU-only mode.

## Installation Steps

### 1. Clone the ROOP-FLOYD repository

First, you need to clone the actual ROOP-FLOYD repository:

```bash
git clone https://codeberg.org/Cognibuild/ROOP-FLOYD.git
```

This will create a `roop-floyd` directory.

### 2. Make the installation script executable

```bash
chmod +x roop_linux_install.sh
```

### 3. Run the installation script

```bash
./roop_linux_install.sh
```

This script will:
- Create a Python virtual environment
- Install all required dependencies
- Set up the application for running

**Note:** The script installs GPU-enabled ONNX Runtime by default (onnxruntime-gpu). If you only have CPU (no NVIDIA GPU), edit the script and switch to the CPU-only version.

## Running the Application

### 1. Make the run script executable

```bash
chmod +x roop_linux_run.sh
```

### 2. Run the application

```bash
./roop_linux_run.sh
```

## Differences from Windows Version

| Aspect | Windows | Linux/Debian |
|--------|---------|--------------|
| Scripts | `.bat` files | `.sh` files |
| Virtual env activation | `call venv\Scripts\activate.bat` | `source venv/bin/activate` |
| ONNX Runtime | DirectML (Windows GPU) | CPU or CUDA (GPU) |
| Python command | `python` | `python3` |
| Path separators | Backslash `\` | Forward slash `/` |

## Troubleshooting

### Permission Denied

If you get "Permission denied" errors:
```bash
chmod +x roop_linux_install.sh roop_linux_run.sh
```

### Python Version Issues

Ensure you're using Python 3.10 or 3.11:
```bash
python3 --version
```

If needed, specify the version explicitly:
```bash
python3.10 -m venv venv
# or
python3.11 -m venv venv
```

### Missing System Dependencies

Some packages may require additional system libraries:
```bash
sudo apt install build-essential libssl-dev libffi-dev python3-dev
```

### GPU Not Working

If you have NVIDIA GPU but it's not being used:
1. Verify CUDA installation: `nvidia-smi`
2. Ensure CUDA toolkit and cuDNN are properly installed
3. Check that `onnxruntime-gpu` was installed (it's the default in the script)
4. Verify GPU is detected: `python3 -c "import onnxruntime as ort; print(ort.get_available_providers())"`
   - Should show `CUDAExecutionProvider` in the list

## Project Information

- Website: www.cognibuild.ai
- Patreon: www.patreon.com/cognibuild
- YouTube: www.youtube.com/@cognibuild
- Repository: https://codeberg.org/Cognibuild/ROOP-FLOYD
