#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_blend=__butvisualcol
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///VISUALISER PICKING
if !window_get_active() exit
image_index=0
if global.customvisuals>1 {
if __visualiser<global.customvisuals-1 __visualiser+=1 else __visualiser=0
}
global.FMODbuf=''
