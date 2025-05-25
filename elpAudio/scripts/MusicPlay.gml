///(fname)
var song,mylastsong,mylastplay,isweb;
mylastsong=-1
mylastplay=-1
isweb=(string_count('http://',argument0)>0 or string_count('https://',argument0)>0)

if variable_global_exists('musicsound') {
    mylastsong=global.musicsound
    if variable_global_exists('playing')
        mylastplay=global.trackhandle
}

if isweb {
    global.musicsound=FMODSoundAddAsyncStream(argument0,0)
    debug('song is streaming from the web')
} else if global.preloaded>0 and global.curpreloaded==global.current {
    global.musicsound=global.preloaded
    debug('song is preloaded')
    global.preloaded=0
    debug('preloaded song was reset')
} else {
    global.musicsound=FMODSoundAdd(argument0,0,__preload_type)
    debug('song is streaming from the disk')
}

song=global.musicsound

if isweb then exit

global.trackhandle=FMODSoundLoop(song,0)
FMODMasterSetVolume(global.volume/100)

FMODInstanceSetLoopCount(global.trackhandle,-1*__repeats)

global.pstate=EA_PLAYING
global.thesong=argument0
global.songlength=GetSoundLength(song)

if FileIsModule(global.thesong) then {
    MetadataGetModuleName(global.thesong)
    global.trackname=GetTrackerName(global.thesong)
} else {
    MetadataGetTags(global.trackhandle)
    global.trackname=CompileFloatText(global.thesong)
}
if mylastplay FMODInstanceStop(mylastplay)
if mylastsong FMODSoundFree(mylastsong)

MusicShowBalloon()
