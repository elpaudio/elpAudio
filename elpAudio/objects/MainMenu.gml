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

chroma=0
//* <//* for original version, /* for no-chromakey version>
chroma=1
window_set_chromakey(1,HexToColor($014426)) // REMOVES THIS COLOR FROM EVERYWHERE
window_resize_buffer(global.plrwidth,global.plrheight,1,display_aa)
/*/

message_position(window_get_x(),window_get_y()+window_get_height())

pressed=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initializer
if !variable_global_exists('___init111') {
    LoadPlugins() //find plugins from plugins folder
    LoadFMOD()
    FMODinit(8,1)
    global.played_from_arg=0
    FMODSpectrumSetSnapshotType(5)
    if variable_global_exists('__rmspd') room_speed=global.__rmspd
    HandlePlaylistLoad()
    draw_set_circle_precision(60)
    global.___init111=1
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PARAMETER STRING
if parameter_count()>0 and global.played_from_arg==0 {
    ds_list_add(global.list,parameter_string(1))
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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///global vars

global.list_size=ds_list_size(global.list)
global._focused= (window_has_focus()||window_get_active()||window_get_minimized())

if global.play {
    global.pos=FMODInstanceGetPosition(global.playing)
    global.formatted_time=current_time_format2(global.songlength)
    global.formatted_cur_pos=current_time_format2((global.pos*global.songlength))

    if global.pos>=0.5 and !global.preloaded and __PreloadNextSong then
        MusicPreload()

    if global.pos>=1 and FMODInstanceGetLoopCount(global.playing)>-1 {
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
    if global.play=0 room_caption=CompileCaptions(__customcaption_idle) else {

        if !__changecaption then
            room_caption=CompileCaptions(__customcaption_play)
        else {
            if cwait>0 then
                cwait-=1*(60/max(fps,30))
            else
                cwait=__captionchangespd*2

            if cwait>=__captionchangespd then
                room_caption=CompileCaptions(__customcaption_ch1)
            else
                room_caption=CompileCaptions(__customcaption_ch2)
        }

    }
}
if window_get_taskbar_caption()!=room_caption
window_set_taskbar_caption(room_caption)
if global.current>global.list_size global.current=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///SAVE LIST AND CLOSE
if file_exists('save_list') {
    file_delete('save_list')
    ListSave(global.__progdir+'playlists\temp.epl')
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
if global.play MusicStop()
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
    draw_set_color(global.frontcol)
    draw_rectangle(x,y,x+w,y+h,0)
}
else
if sprite_exists(global.__img_front) and global.__img_front>-1 {
    draw_set_color(c_white)
    draw_sprite_stretched_ext(global.__img_front,0,x,y,w,h,c_white,1)
    }

draw_set_alpha(1)
draw_set_color(global.captioncol)
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
if keyboard_check_pressed(vk_f4) and __enable_fswitch then
    window_set_fullscreen(!window_get_fullscreen())

if keyboard_check_pressed(vk_f7) {
    if global.play {
        if global.paused then
            MusicResume()
        else {
            if global.stopped then
                MusicResume()
            else
                MusicPause()
            }
    } else
        MusicPlay(GetListEntryRaw(global.current))
}

if keyboard_check_pressed(vk_f5) and global.play then
    MusicStop()

if keyboard_check_pressed(vk_f8) then
    MusicNext()

if keyboard_check_pressed(vk_f6) then
    MusicPrev()

draw_set_color(c_white)
if keyboard_check_pressed(vk_f1) then
        show_message(string_ext("Now playing: {0}#Song length: {1}#Frequency: {2}#Song number: {3}/{4}#Volume: {5}%#Monitors: {6}#(DEBUG)Monitorpos: {7}",global.trackname,global.formatted_time,string(FMODInstanceGetFrequency(global.playing))+"Hz",global.current+1,global.list_size,global.volume,__monitors,__monitorpos))
