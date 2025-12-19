@echo off
setlocal

:: ============================================================
:: 1. Initial setup
:: ============================================================
cd /d "%~dp0"
echo [INFO] Project Root: %CD%

:: ============================================================
:: 2. Create or reuse virtual environment (venv)
:: ============================================================
if exist venv (
    echo [INFO] Virtual environment found. Reusing.
) else (
    echo [INFO] Virtual environment not found. Creating...
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Failed to create venv. Check Python installation.
        pause
        exit /b 1
    )
    echo [INFO] Virtual environment created.
)

:: ============================================================
:: 3. Create VSCode settings.json
:: ============================================================
if not exist .vscode (
    mkdir .vscode
)

echo [INFO] Writing VSCode settings...

(
echo {
echo   "python.defaultInterpreterPath": "${workspaceFolder}\\venv\\Scripts\\python.exe",
echo   "python.terminal.activateEnvironment": true,
echo   "terminal.integrated.defaultProfile.windows": "Command Prompt",
echo   "terminal.integrated.enablePersistentSessions": false
echo }
) > .vscode\settings.json

:: ============================================================
:: 4. Launch VS Code
:: ============================================================
echo [INFO] Launching VS Code...
call code .

if errorlevel 1 (
    echo [ERROR] VS Code command not found. Is it added to PATH?
    pause
    exit /b 1
)

exit
