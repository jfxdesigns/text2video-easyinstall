@echo off
winget install --id Git.Git -e --source winget
winget install --id=Python.Python.3.10  -e
goto prompt_download

:prompt_download
echo -----------------------------------------------------------------------------
echo -            Would you like to download large files now? (y/n)              -
echo -                (you will download the large files later)                  -
echo -----------------------------------------------------------------------------
set /p download_prompt_answer=Enter Here:
if %download_prompt_answer% == "y" goto :download_large
if %download_prompt_answer% == "n" goto :download_small

:download_large
git clone https://huggingface.co/damo-vilab/text-to-video-ms-1.7b
goto install


:download_small
GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/damo-vilab/text-to-video-ms-1.7b
goto install

:install
pip install diffusers transformers accelerate torch
cls
echo -----------------------------------------------------------------------------
echo -                  please launch generate.py to begin                       -
echo -----------------------------------------------------------------------------
pause
