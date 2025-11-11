@echo off
type about.nfo
echo.
echo ROOP Install
echo WARNING. You must have Python 3.10 or 3.11 installed
pause

pip install requests
pip install tqdm

REM git clone https://codeberg.org/Cognibuild/ROOP-FLOYD.git

cd roop-floyd

python -m venv venv

call .\venv\Scripts\activate.bat

pip install tqdm

echo installing requirements 
pip install onnxruntime-directml
pip install -r requirements.txt
pip install --upgrade gradio --force
pip install --upgrade fastapi pydantic
pip install "numpy<2.0"


REM Show completion message
echo Virtual environment made and installed properly

REM Pause to keep the command prompt open
pause
