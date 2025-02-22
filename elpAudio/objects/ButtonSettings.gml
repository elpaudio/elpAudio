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
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
object_event_clear(Visualiser,ev_other,ev_user0);
global.__gonnareset=0
global.customvisuals=0
with Visualiser LoadVisualisers();
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=0
enter=0
execute_program(global.__progdir+'data\elpaudiosettings.exe','',0)
io_clear()
#define Mouse_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var s;s=show_menu('Reload visualisers|Reload plugins',-1)
switch(s){
    case 0: global.__gonnareset=1 alarm[1]=1 break;
    case 1: with all {if object_index==objPlugin if __plugin_from_theme==0 instance_destroy();} LoadPlugins(); break;
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
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,image_blend,1)
