var song,mylastsong;
mylastsong=0
if variable_global_exists('musicsound') {
mylastsong=global.musicsound
//FMODSoundFree(mylastsong)
global.musicsound=FMODSoundAdd(argument0,0,1)
} else global.musicsound=FMODSoundAdd(argument0,0,1)
song=global.musicsound
global.playing=FMODSoundLoop(song,0)
FMODInstanceSetLoopCount(global.playing,-1*loopbutton.on)
FMODMasterSetVolume((global.volume)/100)
global.play=1
global.thesong=argument0
did=0
global.stopped=0
global.paused=0
global.songlength=get_song_length(song)
ea_get_track_info(global.playing)
if file_is_tracker(argument0) global.trackname=tracker_get_name(argument0)
else global.trackname=id3_get_all(argument0)
