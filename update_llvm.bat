
call "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Auxiliary/Build/vcvars64.bat"
cd c:\
git clone https://github.com/llvm/llvm-project
cd C:\llvm-project
git pull
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=clang-cl -DCMAKE_CXX_COMPILER=clang-cl -DLLVM_ENABLE_PROJECTS="lld;lldb;clang;clang-tools-extra" -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind" llvm -B build/
ninja -C build/
ninja -C build/ lldb-vscode
ninja -C build/ lldb-server