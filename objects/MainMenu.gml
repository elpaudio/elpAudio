#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Vars

did=0
fade=1
hh=0
stri=0
alarm[0]=10
alarm[1]=10

cwait=360

xftime=1
yftime=1

randomize()

window_set_chromakey(1,HexToColor($014426)) // REMOVES THIS COLOR FROM EVERYWHERE

message_position(window_get_x(),window_get_y()+window_get_height())
message_size(clamp(view_wview[0],400,900),clamp(view_hview[0],200,900))
global.changeview=1

pressed=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initializer
if variable_global_exists('__init') {
if global.__init=1 {
LoadPlugins() //find plugins from plugins folder
LoadFMOD()
FMODinit(100,1)
}
} else {

LoadPlugins() //find plugins from plugins folder
LoadFMOD()
FMODinit(100,1)
global.__init=0
global.played_from_arg=0
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PARAMETER STRING
if parameter_count()>0 and global.played_from_arg==0 {MusicPlay(parameter_string(1)) ds_list_add(global.list,parameter_string(1)) global.played_from_arg=1}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///MESSAGE BOX POS
message_position(window_get_x(),window_get_y()+window_get_height())
alarm[1]=15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///CAPTION

if !__enablefloat {
if global.play=0 room_caption=CompileCaptions(__customcaption_idle) else {

if !__changecaption {
room_caption=CompileCaptions(__customcaption_play)
} else {
if cwait>0 cwait-=1*(60/max(fps,30)) else cwait=__captionchangespd*2
if cwait>=__captionchangespd {
room_caption=CompileCaptions(__customcaption_ch1)
} else {
room_caption=CompileCaptions(__customcaption_ch2)
}
}

}
}
if window_get_taskbar_caption()!=room_caption
window_set_taskbar_caption(room_caption)
if global.current>global.list_size and global.list_size>0 global.current=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///global vars
if global.play {
global.pos=FMODInstanceGetPosition(global.playing)
global.formatted_time=current_time_format2(global.songlength)
global.formatted_cur_pos=current_time_format2((global.pos*global.songlength))
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///SAVE LIST AND CLOSE
if file_exists('save_list') {
file_delete('save_list')
ListSave(global.__progdir+'playlists\temp.elf')
SettingsSave()
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///MOUSE GRABBING WINDOW
WindowGrab()
#define Keyboard_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
exit
if keyboard_check_pressed(ord('N'))
{
global.dirr=get_string('Type n the new directory wherre to find music.','')

}
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
///Draw TOP MENU && GET POS

//view_stabilize()
if global.play {
if FMODInstanceGetPosition(global.playing)>=1 and FMODInstanceGetLoopCount(global.playing)>-1 {
if __stopsongafter MusicStop() else {
MusicNext()
}
}
}


if useimgforfront=0 {
draw_set_color(global.frontcol)
draw_rectangle(x,y,x+w,y+h,0)
} else if sprite_exists(global.__img_front) and global.__img_front>-1 {draw_set_color(c_white) draw_sprite_stretched_ext(global.__img_front,0,x,y,w,h,c_white,1)}
draw_set_alpha(1)
draw_set_color(global.captioncol)
draw_set_font(global.__fon_cap)
if drawcaption draw_text(x+4,y,room_caption)
draw_set_color(c_white)
#define KeyPress_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(vk_f7) and global.play {
if global.paused MusicResume() else {if global.stopped MusicResume() else MusicPause()}
}

if keyboard_check_pressed(vk_f5) and global.play MusicStop()
if keyboard_check_pressed(vk_f8) {
MusicNext()
}
if keyboard_check_pressed(vk_f6) {
MusicPrev()
}
draw_set_color(c_white)
if keyboard_check_pressed(vk_f1) {
if !keyboard_check(vk_shift) show_message(string_ext("Now playing: {0}#Song length:{1}#Frequency:{2}#Song number:{3}/{4}#Volume:{5}",global.trackname,current_time_format(FMODSoundGetLength(global.musicsound)),string(FMODInstanceGetFrequency(global.playing)/1000)+"KHz",global.current+1,ds_list_size(global.list),global.volume))
else {
var i,list;i=0;list=''; repeat(ds_list_size(global.list)) {list+=string(i+1)+'. '+ds_list_find_value(global.list,i)+'#' i+=1}
message_size(global.plrwidth,string_height(list))
show_message(
string_ext("Queue:{0}",
list
))}
}
