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

### 3. (Optional) Install CUDA for GPU acceleration

If you have an NVIDIA GPU and want GPU acceleration:
```bash
# Follow NVIDIA's official guide for CUDA installation on Debian
# https://developer.nvidia.com/cuda-downloads
```

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

**Note:** The script installs CPU-only ONNX Runtime by default. If you have NVIDIA GPU and CUDA installed, edit the script and uncomment the GPU version line.

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
2. Edit `roop_linux_install.sh` and change `onnxruntime` to `onnxruntime-gpu`
3. Reinstall: `./roop_linux_install.sh`

## Project Information

- Website: www.cognibuild.ai
- Patreon: www.patreon.com/cognibuild
- YouTube: www.youtube.com/@cognibuild
- Repository: https://codeberg.org/Cognibuild/ROOP-FLOYD
