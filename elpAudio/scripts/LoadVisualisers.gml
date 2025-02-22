if directory_exists(working_directory+'\visualisers\') then {
    var iii;iii=0
    var myvis;
    var sty;sty='if __visualiser=={0} and global.play if !global._focused and __DisVisWhenNotAct==1 n=1 else '
    for(myvis=file_find_first(working_directory+'\visualisers\*.vis',fa_hidden);myvis!='';myvis=file_find_next()) {
        global.vis[iii]=myvis
        global.visname[iii]=filename_name(global.vis[iii])
        object_event_add(Visualiser,ev_other,ev_user0,string_ext(sty+'{{{1}}}',iii,file_text_read_all(working_directory+'\visualisers\'+global.vis[iii],' ')))
        global.customvisuals+=1
        iii+=1
    }
    file_find_close()
}
if __visualiser>global.customvisuals {
    if global.customvisuals>0
        __visualiser=__visualiser mod global.customvisuals
    else
        __visualiser=0
}
