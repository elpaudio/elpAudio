///(fname)
var song,mylastsong;
mylastsong=0
isweb=string_count('http://',argument0)>0 or string_count('https://',argument0)>0
if variable_global_exists('musicsound') {
mylastsong=global.musicsound
//FMODSoundFree(mylastsong)
if isweb {global.musicsound=FMODSoundAddAsyncStream(argument0,0) debug('song is streaming from the web')}
else {global.musicsound=FMODSoundAdd(argument0,0,1) debug('song is streaming from the disk')}
} else {
if isweb {global.musicsound=FMODSoundAddAsyncStream(argument0,0) debug('song is streaming from the web')}
else {global.musicsound=FMODSoundAdd(argument0,0,1) debug('song is streaming from the disk')}
}

song=global.musicsound
if isweb exit
global.playing=FMODSoundLoop(song,0)
FMODInstanceSetLoopCount(global.playing,-1*ButtonLoop.on)
FMODMasterSetVolume((global.volume)/100)
global.play=1
global.thesong=argument0
did=0
global.stopped=0
global.paused=0
global.songlength=GetSoundLength(song)
GetTrackInfo(global.playing)
if FileIsModule(argument0) global.trackname=GetTrackerName(argument0)
else global.trackname=CompileFloatText(argument0)
