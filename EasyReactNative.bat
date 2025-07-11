@echo off
setlocal enabledelayedexpansion

title React Native Helper

rem ——————————————————————
rem VS Code extensions list
set "EXTENSIONS=^
 dbaeumer.vscode-eslint ^
 esbenp.prettier-vscode ^
 msjsdiag.vscode-react-native ^
 christian-kohler.path-intellisense ^
 burkeholland.simple-react-snippets ^
 bradlc.vscode-tailwindcss"
rem ——————————————————————

:mainMenu
cls
echo =====================================
echo   React Native Project Manager
echo =====================================
echo 1. Create Project
echo 2. Run Project (current dir or subfolder)
echo 3. Stop React Native Processes
echo 4. Toggle VS Code Extensions
echo 5. Exit
echo.
choice /C 12345 /N /M "Select an option"
set "opt=%errorlevel%"

if "%opt%"=="1" goto create
if "%opt%"=="2" goto run
if "%opt%"=="3" goto stop
if "%opt%"=="4" goto extensions
if "%opt%"=="5" exit /b
goto mainMenu

:create
cls
echo ===== Create New React Native Project =====

:askName
set /p "projectName=Enter new project name: "
if not defined projectName (
  echo Project name cannot be empty.
  pause
  goto askName
)

echo.
echo Creating project "%projectName%"...
call npx @react-native-community/cli init "%projectName%" || (
  echo.
  echo Failed to create project.
  pause
  goto mainMenu
)

echo.
echo Project "%projectName%" created successfully!

rem Optional: remove the .git folder if you prefer a clean slate
if exist "%projectName%\.git" (
  echo.
  set /p "delGit=Delete the auto-created .git folder? (Y/N): "
  if /I "!delGit!"=="Y" (
    echo Deleting .git...
    rmdir /s /q "%projectName%\.git"
    echo .git removed.
  ) else (
    echo Keeping .git folder.
  )
)

echo.
choice /C YN /N /M "Run it now?"
if %errorlevel%==2 goto mainMenu

pushd "%projectName%"
echo.
echo Checking connected Android devices...
call adb devices

echo.
echo Launching Android build...
call npx react-native run-android

popd
goto mainMenu

:run
cls
echo ===== Run Existing React Native Project =====
echo.

rem 1) Try current directory first
if exist package.json (
  echo.
  echo Checking connected Android devices...
  call adb devices

  echo.
  echo Running current project...
  call npx react-native run-android
  pause
  goto mainMenu
)

echo.
echo No React Native project selected or found.
pause
goto mainMenu

:stop
cls
echo -------------------------------------------
echo   Stopping Metro, ADB, Node, Emulator, Gradle
echo -------------------------------------------
for %%P in (node.exe java.exe adb.exe emulator.exe gradle*) do (
  taskkill /F /IM "%%~P" >nul 2>&1
)
call adb kill-server >nul 2>&1

echo.
echo All React Native processes stopped.
pause
goto mainMenu

rem ——— VS Code extensions list (space-separated) ———
set EXTENSIONS_LIST=dbaeumer.vscode-eslint esbenp.prettier-vscode msjsdiag.vscode-react-native christian-kohler.path-intellisense burkeholland.simple-react-snippets bradlc.vscode-tailwindcss

:extensions
echo ===============================
echo VS Code Extension Toggle Script
echo ===============================
echo.
echo [1] install extensions
echo [2] uninstall extensions
echo.

set /p choice=Enter your choice [1/2]: 

if "%choice%"=="1" goto install
if "%choice%"=="2" goto uninstall

echo Invalid choice. Exiting.
pause
exit /b

:install
echo Enabling selected extensions...
call code --install-extension dbaeumer.vscode-eslint
call code --install-extension esbenp.prettier-vscode
call code --install-extension msjsdiag.vscode-react-native
call code --install-extension christian-kohler.path-intellisense
call code --install-extension burkeholland.simple-react-snippets
call code --install-extension bradlc.vscode-tailwindcss
echo Done! Extensions install.
pause
goto mainMenu

:uninstall
echo Disabling selected extensions...
call code --uninstall-extension dbaeumer.vscode-eslint
call code --uninstall-extension esbenp.prettier-vscode
call code --uninstall-extension msjsdiag.vscode-react-native
call code --uninstall-extension christian-kohler.path-intellisense
call code --uninstall-extension burkeholland.simple-react-snippets
call code --uninstall-extension bradlc.vscode-tailwindcss
echo Done! Extensions uninstall.
pause
goto mainMenu
