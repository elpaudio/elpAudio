///(fname)
ds_map_clear(global.metatags);
ds_map_set(global.metatags,'ARTIST','Unknown')
ds_map_set(global.metatags,'ALBUM','Unknown album')
ds_map_set(global.metatags,'GENRE','Unknown genre')
ds_map_set(global.metatags,'DATE','0000-00-00')
ds_map_set(global.metatags,'TRACKNUMBER','00')
ds_map_set(global.metatags,'TITLE',GetTrackerName(argument0))
return 1;
