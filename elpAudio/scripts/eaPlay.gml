//image_index=0
MainMenu.stri=0
FloatText.stri=0
FloatText.alarm[0]=1
FloatText.xx=0

if ds_list_size(global.list)<1 exit
if global.play MusicStop()
MusicPlay(dslist(global.list,argument0))
