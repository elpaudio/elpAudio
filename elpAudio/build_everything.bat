@ECHO OFF

set ver="2.3"

echo Building EXEs
echo [Building original exe]
"%userprofile%\AppData\Roaming\GameMaker8.2\GameMaker.exe" elpAudio.gm82 --build elpAudio.exe
echo [Building nochromakey exe]
copy settings\extensions-nochromakey.txt settings\extensions.txt
copy objects\MainMenu-nochromakey.gml objects\MainMenu.gml
"%userprofile%\AppData\Roaming\GameMaker8.2\GameMaker.exe" elpAudio.gm82 --build elpAudio-nodx9.exe
echo.
echo [Cleanup]
copy settings\extensions-orig.txt settings\extensions.txt
copy objects\MainMenu-orig.gml objects\MainMenu.gml
echo.
echo Building original build without WINAPI2
del elpaudio-%ver%.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-%ver%.zip" LICENSE.txt music_examples\ themes\astronaut themes\clacon2.ttf themes\sourcesans.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis visualisers\fire.vis visualisers\fountain.vis visualisers\playlist.vis visualisers\intmain3k.vis visualisers\img\noalbum.png lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building no-dx9 build without WINAPI2
del elpaudio-%ver%-nodx9.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-%ver%-nodx9.zip" LICENSE.txt music_examples\ themes\astronaut themes\clacon2.ttf themes\sourcesans.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nodx9.exe visualisers\default_*.vis visualisers\fire.vis visualisers\fountain.vis visualisers\playlist.vis visualisers\intmain3k.vis visualisers\img\noalbum.png lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building original build with WINAPI2
del elpaudio-%ver%-winapi.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-%ver%-winapi.zip" data\ico.ico LICENSE.txt windows.dll music_examples\ themes\astronaut themes\clacon2.ttf themes\sourcesans.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis visualisers\fire.vis visualisers\fountain.vis visualisers\playlist.vis visualisers\intmain3k.vis visualisers\img\noalbum.png lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 
echo.
echo Building no-dx9 build with WINAPI2
del elpaudio-%ver%-winapi-nodx9.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-%ver%-winapi-nodx9.zip" data\ico.ico LICENSE.txt windows.dll music_examples\ themes\astronaut themes\clacon2.ttf themes\sourcesans.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nodx9.exe visualisers\default_*.vis visualisers\fire.vis visualisers\fountain.vis visualisers\playlist.vis visualisers\intmain3k.vis visualisers\img\noalbum.png lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 


ECHO DONE
PAUSE