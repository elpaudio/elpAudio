#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
on=0

sprite_index=global.__ico_loop
image_blend=__butloopcol
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=2
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
if global.play {
on=!on
image_index=on
FMODInstanceSetLoopCount(global.playing,-1*on)
} else image_index=0
