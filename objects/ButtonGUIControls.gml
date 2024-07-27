#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
full=0
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=2+3*button
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if !window_get_active() exit
image_index=3*button
if button=0 window_minimize()
if button=1 {
full=!full
}
if button=2 {
if global.play MusicStop()
EndSession()
}
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=1+3*button
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=3*button
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if full {
room_set_height(room,640)
}
*/
draw_self()
if button=0 image_blend=__minibutton1col
if button=1 image_blend=__minibutton2col
if button=2 image_blend=__minibutton3col
