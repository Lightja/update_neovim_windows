set "originalPath=!PATH!"
call "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Auxiliary/Build/vcvars64.bat"
set MSVC="C:/Program Files/Microsoft Visual Studio/2022/Professional/VC/Tools/MSVC/14.39.33519/bin/Hostx64/x64/cl.exe"
set GN_DEFINES=is_official_build=true
set GYP_MSVS_VERSION=2022
set CEF_ARCHIVE_FORMAT=tar.bz2
cd "C:\\cef_automated_build\\chromium\\src"
REM py "c:\\cef_automated_build\\automate\\automate-git.py" --download-dir="c:\\cef_automated_build" --x64-build --no-distrib --with-pgo-profiles
py "c:\\cef_automated_build\\automate\\automate-git.py" --download-dir="c:\\cef_automated_build" --x64-build --minimal-distrib --client-distrib --with-pgo-profiles --force-clean
REM --force-clean removed for this
set "PATH=!originalPath!"