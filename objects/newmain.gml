#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
set_working_directory(global.__progdir)
global.dirr=working_directory
global.FMODbuf = string_repeat(chr(0), 256)
message_input_font('Open Sans',10,c_white,0)
message_button_font('MS UI Gothic',10,c_white,0)
if !registry_exists_ext('elpAudio','FIRST_TIME_DISABLE') {
registry_write_real_ext('elpAudio','FIRST_TIME_DISABLE',1)
show_message('Welcome to elpAudio! 
elpAudio is a simple audio-player using FMOD Sound System. 
Check out "elpoeprod.github.io/elpAudio-player/" or git page "elpaudio/elpAudio" for more info.')
}
message_caption(0,'')

LoadTheme(global.themepath)
draw_set_circle_precision(64)
icon=icon_add(global.__progdir+'data\ico.ico')
window_set_icon(icon)
window_set_taskbar_icon(icon)
file_drag_enable(1)
globalvar delta_time;delta_time=room_speed
instance_destroy()
