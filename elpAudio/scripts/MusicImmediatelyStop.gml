MusicStop()
global.pstate=EA_STOPPED
if variable_global_exists('musicsound') {
    FMODInstanceStop(global.trackhandle)
    FMODSoundFree(global.musicsound)
    global.trackhandle=-1
    global.musicsound=-1
}
MetadataClear()
if global.curpreloaded!=-1
    global.curpreloaded=-1
if global.preloaded {
    FMODSoundFree(global.preloaded)
    global.preloaded=-1
}
