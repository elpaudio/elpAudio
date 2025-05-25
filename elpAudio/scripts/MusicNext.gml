ResetFloatText()
image_index=0
enter=0
if ds_list_empty(global.list) exit
if !global.randomized {
    if global.current<global.list_size-1
        global.current+=1
    else global.current=0
}
else {
    global.current=irandom_fresh(global.current,0,global.list_size-1)
    randomize()
}
if global.pstate=EA_PLAYING
    FMODInstanceStop(global.trackhandle)

MusicPlay(dslist(global.list,global.current))
