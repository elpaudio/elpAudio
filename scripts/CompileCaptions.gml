///(arg)
var ag;ag=argument0;
ag=string_replace_all(ag,'%v',Get_elpAudioVersion())
if global.play=0 {
ag=string_replace_all(ag,'%t1','')
ag=string_replace_all(ag,'%ta1','')
ag=string_replace_all(ag,'%t2','')
ag=string_replace_all(ag,'%ta2','')
ag=string_replace_all(ag,'%pn','')
ag=string_replace_all(ag,'%ps','')
ag=string_replace_all(ag,'%sn','')
} else {
ag=string_replace_all(ag,'%t1',current_time_format(FMODInstanceGetPosition(global.playing)*global.songlength))
ag=string_replace_all(ag,'%ta1',current_time_format(global.songlength))
ag=string_replace_all(ag,'%t2',current_time_format2(FMODInstanceGetPosition(global.playing)*global.songlength))
ag=string_replace_all(ag,'%ta2',current_time_format2(global.songlength))
ag=string_replace_all(ag,'%pn',string(global.current+1))
ag=string_replace_all(ag,'%ps',string(ds_list_size(global.list)))
ag=string_replace_all(ag,'%sn',global.trackname)
}
//ag=string_replace_all(ag,'%v',get_version())
//show_message(ag)
return ag;
