#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=global.__ico_loop
image_index=__repeats
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
if global.pstate!=EA_NONE {
    __repeats=!__repeats
    image_index=__repeats
    FMODInstanceSetLoopCount(global.trackhandle,-1*__repeats)
} else image_index=__repeats
