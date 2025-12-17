@echo off
cd /d %~dp0

:: 1. Check if the virtual environment exists, create it if not
if not exist venv (
    echo Virtual environment not found.
    echo Creating virtual environment...
    python -m venv venv
) else (
    echo Virtual environment already exists.
)

:: 2. Activate the virtual environment
call venv\Scripts\activate
echo Virtual environment activated.

:: 3. Display instructions for running the Python file
echo =====================================
echo To run your Python script, use the following command:
echo =====================================
echo 1. Activate the virtual environment (if not already activated):
echo    venv\Scripts\activate
echo 2. Install required modules (e.g., {module_name}):
echo    pip install {module_name}
echo 3. Run the Python file (e.g., {script_name}):
echo    python {script_name}.py
echo =====================================
echo.

:: 4. Provide options to the user
echo Please choose an option:
echo 1. Exit
echo 2. Open VSCode in the current directory with the virtual environment activated
set /p choice=Enter your choice (1 or 2): 

if "%choice%"=="1" (
    echo Exiting...
    exit
) else if "%choice%"=="2" (
    echo Opening VSCode in the current directory with the virtual environment activated...
    code .
) else (
    echo Invalid choice. Exiting...
    exit
)

pause
