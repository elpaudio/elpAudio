///(arg)
var ag;ag=argument0;
ag=string_replace_all(ag,'%v',ea_version)
if global.pstate=EA_NONE { // if no music is playing
ag=string_replace_all(ag,'%t1','')
ag=string_replace_all(ag,'%ta1','')
ag=string_replace_all(ag,'%t2','')
ag=string_replace_all(ag,'%ta2','')
ag=string_replace_all(ag,'%pn','')
ag=string_replace_all(ag,'%ps','')
ag=string_replace_all(ag,'%sn','')
ag=string_replace_all(ag,'%tra','')
ag=string_replace_all(ag,'%trt','')
ag=string_replace_all(ag,'%trf','')
ag=string_replace_all(ag,'%trg','')
ag=string_replace_all(ag,'%try','')
ag=string_replace_all(ag,'%trn','')
} else { //if it plays
ag=string_replace_all(ag,'%t1',current_time_format(global.pos*global.songlength))
ag=string_replace_all(ag,'%ta1',current_time_format(global.songlength))
ag=string_replace_all(ag,'%t2',global.formatted_cur_pos)
ag=string_replace_all(ag,'%ta2',global.formatted_time)
ag=string_replace_all(ag,'%pn',string(global.current+1))
ag=string_replace_all(ag,'%ps',string(ds_list_size(global.list)))
ag=string_replace_all(ag,'%sn',global.trackname)
ag=string_replace_all(ag,'%tra',MetadataGetTag('ARTIST'))
ag=string_replace_all(ag,'%trt',MetadataGetTag('TITLE'))
ag=string_replace_all(ag,'%trf',MetadataGetTag('ALBUM'))
ag=string_replace_all(ag,'%trg',MetadataGetTag('GENRE'))
ag=string_replace_all(ag,'%try',MetadataGetTag('DATE'))
ag=string_replace_all(ag,'%trn',MetadataGetTag('TRACKNUMBER'))
}
return ag;
