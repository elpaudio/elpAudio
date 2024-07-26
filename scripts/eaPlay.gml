//image_index=0
MainMenu.stri=0
visualname.stri=0
visualname.alarm[0]=1
visualname.xx=0

if ds_list_size(global.list)<1 exit
if global.play MusicStop()
MusicPlay(ds_list_find_value(global.list,argument0))
