#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=global.__ico_migui
image_speed=0
full=0
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=2+3*button
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if !global._focused exit
image_index=3*button
if button=0 window_minimize()
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
if !global._focused exit
image_index=1+3*button
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=3*button
