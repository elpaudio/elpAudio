#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
/*if opt>-1 on=!on
image_index=on
if opt=-1 {
if __speed>5 __speed-=5 else __speed=60
text='Text speed: '+string(__speed)
}
if opt=0 {
if global.play mus_stop()
FMODfree()
room_restart()
}
if opt=1 {
theme=get_open_filename('elpAudio theme file|*.ini','theme.ini')
if theme='' nothing=1 else {
show_message('Loaded theme from:#'+theme)
get_theme(theme)
settings_save()
global.___hhh=0
room_restart()
global._init=0
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntCaption)
draw_set_color(global.captioncol)
draw_text(x+12,y-4,text)
draw_set_color(merge_color(c_white,merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.35,current_time*0.06)),0.25))
draw_self()
draw_set_color(c_white)
