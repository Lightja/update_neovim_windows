@echo off
@echo.     
@echo.    
@echo.    
@echo.    
@echo.    
@echo.    
@echo PREREQUISITES
@echo -------------
@echo 1. run install_scoop.bat - this will install scoop. Then from CMD, run:
@echo 2. scoop install gcc
@echo 3. scoop install gettext
@echo 4. open 64-bit VS CMD console (vcvars64.bat). example location: C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat
@echo 5. run this file from the 64-bit VS CMD Console
@echo.    
@echo     (note: deletes existing install, should not impact customized neovim profile if it's in the default location: %localappdata%.)
@echo.    
@echo Confirm the above requirements before continuing!!! Press enter to continue...
pause
rd /s /q "C:\Tools\neovim"
mkdir "C:\Tools"
cd "C:\Tools"
git clone "https://github.com/neovim/neovim"
cd neovim
cmake -S cmake.deps -B .deps -G Ninja -D CMAKE_BUILD_TYPE=Release
cmake --build .deps --config Release
cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=Release
cmake --build build --config Release
setx VIMRUNTIME "C:\Tools\neovim\runtime" /M
@echo.
@echo.
@echo.
@echo Done! Ignore warnings and verify VIMRUNTIME was set in environment variables, then run nvim.exe to confirm it updated.
pause

