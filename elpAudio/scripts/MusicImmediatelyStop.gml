MusicStop()
global.stopped=1
global.paused=0
if variable_global_exists('musicsound') {
    FMODInstanceStop(global.playing)
    FMODSoundFree(global.musicsound)
    global.playing=-1
    global.musicsound=-1
}
MetadataClear()
if global.curpreloaded!=-1
    global.curpreloaded=-1
if global.preloaded {
    FMODSoundFree(global.preloaded)
    global.preloaded=-1
}
