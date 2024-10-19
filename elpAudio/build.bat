@ECHO OFF

echo Building original build without WINAPI2
del elpaudio.zip
"c:\program files\7-zip\7z.exe" a "elpaudio.zip" LICENSE.txt music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 

echo Building no-chromakey build without WINAPI2
del elpaudio-nochromakey.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-nochromakey.zip" LICENSE.txt music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nochromakey.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 

echo Building original build with WINAPI2
del elpaudio-winapi.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-winapi.zip" LICENSE.txt windows.dll music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.m3u -xr!*.m3u8 -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 

echo Building no-chromakey build with WINAPI2
del elpaudio-nochromakey-winapi.zip
"c:\program files\7-zip\7z.exe" a "elpaudio-nochromakey-winapi.zip" LICENSE.txt windows.dll music_examples\ themes\tahoma.ttf data\elpAudioSettings.exe data\vars.txt elpaudio-nochromakey.exe visualisers\default_*.vis lib_audio.dll fmodex.dll README.txt -xr!*.zip plugins\README.txt plugins\test.plg plugins\ea_monitors.dll plugins\monitor.plg themes\default themes\light themes\compact themes\readme.txt -xr!themes\*\playlist\ 


ECHO DONE
PAUSE