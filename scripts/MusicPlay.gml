///(fname)
var song,mylastsong;
mylastsong=0
isweb=string_count('http://',argument0)>0 or string_count('https://',argument0)>0

if variable_global_exists('musicsound') then
    mylastsong=global.musicsound

if isweb then {
    global.musicsound=FMODSoundAddAsyncStream(argument0,0)
    debug('song is streaming from the web')
} else {
    global.musicsound=FMODSoundAdd(argument0,0,__preload_type)
    debug('song is streaming from the disk')
}

song=global.musicsound

if isweb then exit

global.playing=FMODSoundLoop(song,0)
FMODInstanceSetLoopCount(global.playing,-1*ButtonLoop.on)
FMODMasterSetVolume((global.volume)/100)

global.play=1
global.thesong=argument0
global.stopped=0
global.paused=0
global.songlength=GetSoundLength(song)

GetTrackInfo(global.playing)

if FileIsModule(argument0) then
global.trackname=GetTrackerName(argument0)
else
global.trackname=CompileFloatText(argument0)
