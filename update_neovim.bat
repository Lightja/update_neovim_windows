@echo off
@echo.     
@echo.    
@echo.    
@echo.    
@echo.    
@echo.    
@echo PREREQUISITES
@echo -------------
@echo 1. run install_scoop.bat
@echo 2. run install_choco.bat.
@echo 3. run update_core_packages.bat (helps to ensure a consistent and updated environment)
@echo 4. verify choco bin folder with installed packages is near the TOP of PATH to ensure latest versions are used.
@echo 5. open 64-bit VS CMD console (vcvars64.bat) as administrator. example location: C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat
@echo 6. run this file from the 64-bit VS CMD Console
@echo.    
@echo        (note: deletes existing install, should not impact customized neovim profile if it's in the default location: %localappdata%.)
@echo.    
@echo    Confirm the above requirements before continuing!!!
@echo.    
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
cls
@echo.
@echo.
@echo.
@echo      done! - Recommended optional steps:
@echo                - add C:\Tools\neovim\build\bin to PATH if its not already.
@echo                - delete %localappdata%\nvim-data - Deletes plugin data, but ensures fresh install.
@echo                - if you want LLDB-DAP for DAP debugging: add %userprofile%\scoop\apps\mingw-winlibs-llvm-ucrt\14.2.0-19.1.1-12.0.0-r2\bin\lldb-dap.exe to LLDB config
@echo                - if using lazy.nvim: - verify treesitter in lazy config: { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"}
@echo                                      - post lazy config: 1. make sure you are NOT calling  require 'nvim-treesitter.configs'.setup - TSUpdate will handle it.
@echo                                                          2. require 'nvim-treesitter.configs'.compilers = { "zig" }-- Zig is reliable, but try gcc/clang if needed.
@echo                - if using Mason: manually install clangd, lua-language-server, gopls, rust-analyzer, and others as needed. configure lspconfig to find them manually.
@echo.
@echo.
@echo.
@echo   OPTIONAL: Press enter 3 times to create symbolic link "vim.exe" for "nvim.exe" (must be in an elevated console, skip this step if vim is installed on this machine.)
pause
pause
pause
cd c:\tools\neovim\build\bin
mklink vim.exe nvim.exe
refreshenv
vim .