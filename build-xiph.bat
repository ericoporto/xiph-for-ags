echo on
echo creating directories...

IF exist %TEMP%\nul ( echo %TEMP% ) ELSE ( mkdir %TEMP% )
IF exist lib\nul ( del /s /f /q lib\*.* ) ELSE ( mkdir lib )
IF exist include\nul ( del /s /f /q include\*.* ) ELSE ( mkdir include )
IF exist %TEMP%\vcpkg ( del /s /f /q  %TEMP%\vcpkg ) 

mkdir include\ogg
mkdir include\theora
mkdir include\vorbis

pushd %TEMP% 
git clone https://github.com/Microsoft/vcpkg.git 
pushd vcpkg 
if not exist vcpkg.exe call bootstrap-vcpkg.bat 
vcpkg install libogg:x86-windows-static libtheora:x86-windows-static libvorbis:x86-windows-static 
popd 
popd 

copy %TEMP%\vcpkg\installed\x86-windows-static\lib\ogg.lib lib\libogg_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\theora.lib lib\libtheora_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\vorbis.lib lib\libvorbis_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\vorbisfile.lib lib\libvorbisfile_static.lib

copy %TEMP%\vcpkg\installed\x86-windows-static\include\ogg\*.h include\ogg\
copy %TEMP%\vcpkg\installed\x86-windows-static\include\theora\*.h include\theora\
copy %TEMP%\vcpkg\installed\x86-windows-static\include\vorbis\*.h include\vorbis\

echo succesfully copied files!