MainMenu.stri=0
FloatText.stri=0
FloatText.alarm[0]=1
FloatText.xx=0
image_index=0
enter=0
if ds_list_size(global.list)<1 exit
if !global.randomized {if global.current>0 global.current-=1 else global.current=global.list_size-1}
else {global.current=irandom_fresh(global.current,0,global.list_size-1)}

if global.play MusicStop()
MusicPlay(ds_list_find_value(global.list,global.current))
