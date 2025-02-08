ResetFloatText()
image_index=0
enter=0

if ds_list_empty(global.list) exit
if (global.pos*global.songlength)>1000
    FMODInstanceSetPosition(global.playing,0)
else {
if !global.randomized {if global.current>0 global.current-=1 else global.current=global.list_size-1}
else {global.current=irandom_fresh(global.current,0,global.list_size-1) randomize()}

if global.play MusicStop()
global.preloaded=0
MusicPlay(dslist(global.list,global.current))
}
