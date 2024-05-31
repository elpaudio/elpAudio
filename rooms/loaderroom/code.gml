//hrt_set_resolution(1000000)
settings_load()
read_wh()
view_wview[0]=global.plrwidth
view_hview[0]=global.plrheight
view_wport[0]=global.plrwidth
view_hport[0]=global.plrheight
if !variable_global_exists('___hhh') {
room_set_view(mainroom,0,1,0,0,global.plrwidth,global.plrheight,0,0,global.plrwidth,global.plrheight,0,0,0,0,-1)
room_set_width(mainroom,global.plrwidth)
room_set_height(mainroom,global.plrheight)
//room_restart()
global.___hhh=1
}
room_goto_next()
