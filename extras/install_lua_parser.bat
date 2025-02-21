setlocal enabledelayedexpansion
set "originalPath=!PATH!"
call "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Auxiliary/Build/vcvars64.bat"
set CLANGCL="C:/Program Files/LLVM/bin/clang-cl.exe"
set CFLAGSCLANGCL=/O2 /DNDEBUG /MT


REM -- INSTALLS LUA PARSER FROM SOURCE FOR NEOVIM BECAUSE TREESITTER HATES WINDOWS (OR I DID SOMETHING TO OFFEND IT)
REM (MOVES output .dll to %LOCALAPPDATA%\nvim-data\lazy\nvim-treesitter\parser\luau.dll
rd /s /q ".\tree-sitter-luau"
git clone "https://github.com/tree-sitter-grammars/tree-sitter-luau"
cd tree-sitter-luau
cmake -S . -B build/ -G "Ninja" -DCMAKE_CXX_COMPILER=%CLANGCL% -DCMAKE_C_COMPILER=%CLANGCL% -DCMAKE_C_FLAGS_RELEASE="%CFLAGSCLANGCL%" -DCMAKE_CXX_FLAGS_RELEASE="%CFLAGSCLANGCL%" -DCMAKE_BUILD_TYPE=Release 
ninja -C build/
cd ..
move /Y ".\tree-sitter-luau\build\tree-sitter-luau.dll" "%LOCALAPPDATA%\nvim-data\lazy\nvim-treesitter\parser\lua.dll"
REM rd /s /q ".\tree-sitter-luau"





set "PATH=!originalPath!"
pause