#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Vars
alarm[0]=10
alarm[10]=10

cwait=360
hh=0
xftime=1
yftime=1




randomize()

chroma=1
window_set_chromakey(1,HexToColor($014426)) // REMOVES THIS COLOR FROM EVERYWHERE
window_resize_buffer(global.plrwidth,global.plrheight,1,display_aa)

message_position(window_get_x(),window_get_y()+window_get_height())

pressed=0
grabbed=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initializer
    LoadPlugins() //find plugins from plugins folder
    LoadFMOD()
    FMODinit(8,1)
    global.played_from_arg=0
    FMODSpectrumSetSnapshotType(5)
    if variable_global_exists('__rmspd') room_speed=global.__rmspd
    HandlePlaylistLoad()
    draw_set_circle_precision(60)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PARAMETER STRING
if parameter_count()>0 and global.played_from_arg==0 {
    dslist(global.list,-1,parameter_string(1))
    global.current=ds_list_size(global.list)-1
    MusicPlay(parameter_string(1))
    global.played_from_arg=1
    }
#define Alarm_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///playlist handle
global._loaded_list=0
global.__gonnareset=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///global vars

global.list_size=ds_list_size(global.list)
global._focused= (window_has_focus()||window_get_active()||window_get_minimized())

if global.pstate!=EA_NONE {
    global.pos=FMODInstanceGetPosition(global.trackhandle)
    global.formatted_time=current_time_format2(global.songlength)
    global.formatted_cur_pos=current_time_format2((global.pos*global.songlength))

    if global.pos>=0.5 and !global.preloaded and __PreloadNextSong then
        MusicPreload()

    if global.pos>=1 and FMODInstanceGetLoopCount(global.trackhandle)>-1 {
        if __stopsongafter MusicStop() else {
            MusicNext()
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///CAPTION

if !__enablefloat {
    if global.pstate=EA_NONE room_caption=CompileCaptions(__customcaption_idle) else {

        if !__changecaption
            room_caption=CompileCaptions(__customcaption_play)
        else {
            if cwait>0
                cwait-=1*(60/max(fps,30))
            else
                cwait=__captionchangespd*2

            if cwait>=__captionchangespd
                room_caption=CompileCaptions(__customcaption_ch1)
            else
                room_caption=CompileCaptions(__customcaption_ch2)
        }

    }
}

if string(window_get_taskbar_caption())!=room_caption // this fucking bitch stopped working normally
    window_set_taskbar_caption(string(room_caption))
if global.current>global.list_size
    global.current=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///load new theme
if file_exists('save_list') {
    file_delete('save_list')
    SettingsSave()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Update delta time
delta_time=room_speed//(60/max(fps,1))
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///MOUSE GRABBING WINDOW
WindowGrab()
#define Keyboard_18
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(vk_f4) {
    if global.pstate!=EA_STOPPED MusicStop()
    EndSession()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw TOP MENU

if useimgforfront=0 {
    draw_set_color(Color('top_menu'))
    draw_rectangle(x,y,x+w,y+h,0)
}
else
if sprite_exists(imgfront) and imgfront>-1 {
    draw_sprite_stretched_ext(imgfront,0,x,y,w,h,c_white,1)
}

draw_set1(Color('caption'),1)
draw_set_font(global.__fon_cap)

if drawcaption then
    draw_text(x+4+textx,y+texty,room_caption)

draw_set_color(c_white)
#define KeyPress_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(vk_tab) {if __visualiser<global.customvisuals-1 __visualiser+=1 else __visualiser=0}

if keyboard_check_pressed(vk_f7) {
    switch(global.pstate) {
    case EA_PLAYING:
        MusicPause() break
    case EA_PAUSED:
    case EA_STOPPED:
        MusicResume() break
    case EA_NONE:
        MusicPlay(GetListEntryRaw(global.current))
    }
}

if keyboard_check_pressed(vk_f5) and global.pstate!=EA_NONE then
    MusicStop()

if keyboard_check_pressed(vk_f8) then
    MusicNext()

if keyboard_check_pressed(vk_f6) then
    MusicPrev()

draw_set_color(c_white)
if keyboard_check_pressed(vk_f1) then
        show_message(string_ext("Now playing: {0}#Song length: {1}#Frequency: {2}#Song number: {3}/{4}#Volume: {5}%#Monitors: {6}#I made this message when FPS was {7}!#x {8} y {9}",global.trackname,global.formatted_time,string(FMODInstanceGetFrequency(global.trackhandle))+"Hz",global.current+1,global.list_size,global.volume,__monitors,fps,window_get_x(),window_get_y()))
