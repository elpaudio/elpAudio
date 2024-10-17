if global.list_size<=1 exit
global.preloaded=FMODSoundAdd(ds_list_find_value(global.list,(global.current+1) mod global.list_size),0,__preload_type)
global.curpreloaded=global.current+1
return 1
