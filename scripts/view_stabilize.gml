/* //view_visible[0]=true
//room_set_view_enabled(room,true)
view_wview[0]=global.plrwidth
view_hview[0]=global.plrheight
view_wport[0]=global.plrwidth
view_hport[0]=global.plrheight
if !variable_global_exists('___hhh') {
room_set_view(room,0,1,0,0,global.plrwidth,global.plrheight,0,0,global.plrwidth,global.plrheight,0,0,0,0,-1)
room_set_width(room,global.plrwidth)
room_set_height(room,global.plrheight)
//room_restart()
global.___hhh=1
}/* else {
if global.___hhh=0 {
room_set_view(room,0,1,0,0,global.plrwidth,global.plrheight,0,0,global.plrwidth,global.plrheight,0,0,0,0,-1)
room_set_width(room,global.plrwidth)
room_set_height(room,global.plrheight)
room_restart()
global.___hhh=1
}
}
//if global.changeview {window_set_size(global.plrwidth,global.plrheight) global.changeview=0}
//show_message(global.plrheight)
//show_message(view_hview[0])
