scoop install gettext
scoop bucket add versions
scoop install mingw-winlibs-llvm-ucrt
scoop update
scoop update *
scoop cleanup *
scoop status
choco uninstall mingw
choco install msys2
choco install mingw
choco install cmake.install
choco install llvm
choco install lua
choco install make
choco install ninja
choco install tree-sitter
choco install vcredist140
choco install visualstudio2022buildtools
choco install curl
choco install gzip
choco upgrade all