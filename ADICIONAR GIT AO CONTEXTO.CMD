@echo off & TITLE Adicionando GIT-BASH ao menu de contexto
setlocal enabledelayedexpansion

:: Obtém o caminho absoluto do script atual
set "SCRIPT_PATH=%~dp0"
set "GIT_BASH_PATH=!SCRIPT_PATH!git-bash.exe"

:: Verifica se git-bash.exe existe
if not exist "!GIT_BASH_PATH!" (
    echo Erro: git-bash.exe não encontrado em "!SCRIPT_PATH!"
    pause
    exit /b
)

:: Define a chave do registro
set "REG_PATH=HKEY_CLASSES_ROOT\Directory\Background\shell\Git Bash Aqui"
set "CMD_PATH=HKEY_CLASSES_ROOT\Directory\Background\shell\Git Bash Aqui\command"

:: Adiciona a entrada ao menu de contexto
reg add "!REG_PATH!" /ve /d "Git Bash Aqui" /f >nul
:: reg add "!REG_PATH!" /v "Icon" /d "!SCRIPT_PATH!mingw64\share\git\git-for-windows.ico" /f >nul
reg add "!REG_PATH!" /v "Icon" /d "!SCRIPT_PATH!mingw64\share\git\git01.ico" /f >nul
reg add "!CMD_PATH!" /ve /d "\"!GIT_BASH_PATH!\" --cd=\"%%V\"" /f >nul

echo Git Bash foi adicionado ao menu de contexto! & pause >nul
