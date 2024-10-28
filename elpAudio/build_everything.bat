@ECHO OFF

echo Building EXEs
echo [Building original exe]
"%userprofile%\AppData\Roaming\GameMaker8.2\GameMaker.exe" elpAudio.gm82 --build elpAudio.exe
echo [Building nochromakey exe]
copy settings\extensions-nochromakey.txt settings\extensions.txt
copy objects\MainMenu-nochromakey.gml objects\MainMenu.gml
"%userprofile%\AppData\Roaming\GameMaker8.2\GameMaker.exe" elpAudio.gm82 --build elpAudio-nochromakey.exe
echo.
echo [Cleanup]
copy settings\extensions-orig.txt settings\extensions.txt
copy objects\MainMenu-orig.gml objects\MainMenu.gml
echo.
echo Building original build without WINAPI2
del elpaudio.zip
"c:\program files\7-zip\7z.exe" a "elpaudio.zip" LICENSE.txt music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building no-chromakey build without WINAPI2
del elpaudio-nochromakey.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-nochromakey.zip" LICENSE.txt music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nochromakey.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building original build with WINAPI2
del elpaudio-winapi.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-winapi.zip" data\ico.ico LICENSE.txt windows.dll music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building no-chromakey build with WINAPI2
del elpaudio-nochromakey-winapi.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-nochromakey-winapi.zip" data\ico.ico LICENSE.txt windows.dll music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nochromakey.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 


ECHO DONE
PAUSE