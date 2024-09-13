if directory_exists(working_directory+'\visualisers\') then {
    var iii;iii=1
    var str;str="if !window_get_active() and __DisVisWhenNotAct==1 n=1 else {"
    global.vis[0]=file_find_first(working_directory+'\visualisers\*.vis',fa_hidden)
    if global.vis[0]!='' {
        global.visname[0]=filename_name(global.vis[0])
        global.vis[0]=file_text_read_all(working_directory+'\visualisers\'+global.vis[0],' ')
        global.customvisuals=1
        repeat(128) {
            global.vis[iii]=file_find_next()
            if global.vis[iii]!='' {
                global.visname[iii]=filename_name(global.vis[iii])
                object_event_add(Visualiser,ev_draw,0,string_ext('if __visualiser=={0} and global.play if !window_get_active() and __DisVisWhenNotAct==1 n=1 else {{{1}}}',iii,file_text_read_all(working_directory+'\visualisers\'+global.vis[iii],' ')))
                global.customvisuals+=1
                iii+=1
            } else break; //for faster load
        }

    }
}
if __visualiser>global.customvisuals then
    __visualiser=__visualiser mod global.customvisuals
