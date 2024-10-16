#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
enter=0
global.settings=0
nope=1
sprite_index=global.__ico_stngs
image_blend=__butsettcol
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
execute_program(global.__progdir+'data\elpaudiosettings.exe','',0)
#define Mouse_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var s;s=show_menu('Reload visualisers|Reload plugins',-1)
switch(s){
case 0: object_event_clear(Visualiser,ev_other,ev_user0); LoadVisualisers(); break;
case 1: with objPlugin instance_destroy(); LoadPlugins(); break;
default: break;
}
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
