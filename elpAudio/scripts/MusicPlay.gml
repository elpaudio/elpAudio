///(fname)
var song,mylastsong,mylastplay,isweb;
mylastsong=-1
mylastplay=-1
isweb=(string_count('http://',argument0)>0 or string_count('https://',argument0)>0)

if variable_global_exists('musicsound') {
    mylastsong=global.musicsound
    if variable_global_exists('playing')
        mylastplay=global.playing
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

global.playing=FMODSoundLoop(song,0)
FMODMasterSetVolume(global.volume/100)

FMODInstanceSetLoopCount(global.playing,-1*ButtonLoop.on)

global.play=1
global.thesong=argument0
global.stopped=0
global.paused=0
global.songlength=GetSoundLength(song)

if FileIsModule(global.thesong) then {
    MetadataGetModuleName(global.thesong)
    global.trackname=GetTrackerName(global.thesong)
} else {
    MetadataGetTags(global.playing)
    global.trackname=CompileFloatText(global.thesong)
}
if mylastplay FMODInstanceStop(mylastplay)
if mylastsong FMODSoundFree(mylastsong)

MusicShowBalloon()
