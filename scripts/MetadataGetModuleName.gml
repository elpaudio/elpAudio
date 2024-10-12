///(fname)
ds_map_clear(global.metatags);
ds_map_set(global.metatags,'DATE','NONE')
ds_map_set(global.metatags,'YEAR','NONE')
ds_map_set(global.metatags,'ARTIST','NONE')
ds_map_set(global.metatags,'TRACKNUMBER','NONE')
ds_map_set(global.metatags,'TRACK','NONE')
ds_map_set(global.metatags,'ALBUM','NONE')
ds_map_set(global.metatags,'DATE','NONE')
ds_map_set(global.metatags,'TITLE',GetTrackerName(argument0))
return 1;
