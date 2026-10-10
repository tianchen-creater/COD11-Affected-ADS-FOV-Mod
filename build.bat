@echo off
echo Building COD11_Affected_FOV_Fix.exe with PyInstaller...
pip install pyinstaller >nul 2>&1
pyinstaller --onefile --clean --name "COD11_Affected_FOV_Fix" src\COD11_FOV_Fix.py
echo.
echo Build finished! The executable is located in the dist\ folder.
pause
