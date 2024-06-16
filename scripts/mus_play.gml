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
