#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=0
image_speed=0
sprite_index=global.__ico_playr
image_blend=__butplayrandcol
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
if !window_get_active() exit
image_index=0
enter=0
MainMenu.stri=0
visualname.stri=0
visualname.xx=0
if ds_list_size(global.list)<1 exit
if global.play mus_stop()
global.current=random_range_notme(global.current,0,ds_list_size(global.list)-1)
mus_play(string(ds_list_find_value(global.list,global.current)))
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
enter=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
enter=0
