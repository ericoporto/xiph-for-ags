@echo on
echo creating directories...

IF exist %TEMP%\nul ( echo %TEMP% ) ELSE ( mkdir %TEMP% )
IF exist lib\nul ( del /s /f /q lib\*.* ) ELSE ( mkdir lib )
IF exist include\nul ( del /s /f /q include\*.* ) ELSE ( mkdir include )
IF exist %TEMP%\vcpkg ( del /s /f /q  %TEMP%\vcpkg )

IF exist lib\x86\nul ( del /s /f /q lib\x86\*.* ) ELSE ( mkdir lib\x86 )
IF exist lib\x64\nul ( del /s /f /q lib\x64\*.* ) ELSE ( mkdir lib\x64 )

mkdir include\ogg
mkdir include\theora
mkdir include\vorbis

pushd %TEMP% 
git clone https://github.com/Microsoft/vcpkg.git 
pushd vcpkg 
if not exist vcpkg.exe call bootstrap-vcpkg.bat 
vcpkg install libogg:x86-windows-static libtheora:x86-windows-static libvorbis:x86-windows-static 
vcpkg install libogg:x64-windows-static libtheora:x64-windows-static libvorbis:x64-windows-static 
popd 
popd 

copy %TEMP%\vcpkg\installed\x86-windows-static\lib\ogg.lib lib\x86\libogg_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\theora.lib lib\x86\libtheora_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\vorbis.lib lib\x86\libvorbis_static.lib 
copy %TEMP%\vcpkg\installed\x86-windows-static\lib\vorbisfile.lib lib\x86\libvorbisfile_static.lib

copy %TEMP%\vcpkg\installed\x64-windows-static\lib\ogg.lib lib\x64\libogg_static.lib
copy %TEMP%\vcpkg\installed\x64-windows-static\lib\theora.lib lib\x64\libtheora_static.lib
copy %TEMP%\vcpkg\installed\x64-windows-static\lib\vorbis.lib lib\x64\libvorbis_static.lib
copy %TEMP%\vcpkg\installed\x64-windows-static\lib\vorbisfile.lib lib\x64\libvorbisfile_static.lib

copy %TEMP%\vcpkg\installed\x86-windows-static\include\ogg\*.h include\ogg\
copy %TEMP%\vcpkg\installed\x86-windows-static\include\theora\*.h include\theora\
copy %TEMP%\vcpkg\installed\x86-windows-static\include\vorbis\*.h include\vorbis\

type %TEMP%\vcpkg\installed\x86-windows-static\share\libogg\copyright
type %TEMP%\vcpkg\installed\x86-windows-static\share\libtheora\copyright
type %TEMP%\vcpkg\installed\x86-windows-static\share\libvorbis\copyright

echo xiph libogg libtheora libvorbis licenses > LICENSE.txt
echo . >> LICENSE.txt
echo libogg LICENSE >> LICENSE.txt
type %TEMP%\vcpkg\installed\x86-windows-static\share\libogg\copyright >> LICENSE.txt
echo . >> LICENSE.txt
echo libtheora LICENSE >> LICENSE.txt
type %TEMP%\vcpkg\installed\x86-windows-static\share\libtheora\copyright >> LICENSE.txt
echo . >> LICENSE.txt
echo libvorbis LICENSE >> LICENSE.txt
type %TEMP%\vcpkg\installed\x86-windows-static\share\libvorbis\copyright  >> LICENSE.txt
echo . >> LICENSE.txt

echo successfully copied files!
