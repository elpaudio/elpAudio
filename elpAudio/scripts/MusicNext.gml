MainMenu.stri=0
FloatText.alarm[0]=1
FloatText.stri=0
FloatText.xx=0
image_index=0
enter=0
if ds_list_empty(global.list) exit
if !global.randomized {if global.current<global.list_size-1 global.current+=1 else global.current=0}
else {global.current=irandom_fresh(global.current,0,global.list_size-1) randomize()}
if global.play FMODInstanceStop(global.playing)
MusicPlay(ds_list_find_value(global.list,global.current))
