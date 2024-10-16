#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=global.__ico_visua
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
#define Mouse_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mystr,i;mystr='';i=0 repeat(global.customvisuals) {
mystr+='Visualiser '+string(i+1)+' - '+string(global.visname[i])+'|'
i+=1
}
__visualiser=show_menu(mystr,__visualiser)
