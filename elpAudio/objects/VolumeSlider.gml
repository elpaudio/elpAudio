#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
can=0
press=0
sprite_index=global.__ico_volslider

slidercol=c_white
slidercol2=c_white
holdercol=c_white
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
press=1
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
can=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
slw=sprite_get_width(global.__ico_volholder)
slh=sprite_get_height(global.__ico_volholder)
if
point_in_rectangle(mouse_x,mouse_y,
x-can*100,y-can*100,x+sprite_width+can*100,y+sprite_height+can*100)
and press
{
if mouse_check_button(mb_left) {
if vertical global.volume=round(clamp(sprite_height-(mouse_y-y),0,sprite_height)*(100/sprite_height))
else global.volume=round(clamp(mouse_x-x,0,sprite_width)*(100/sprite_width))
FMODMasterSetVolume(global.volume/100)
} else {can=0}
}

draw_sprite_ext(sprite_index,vertical,x,y,1,1,0,slidercol,1)

draw_sprite_part_ext(sprite_index,1-vertical,0,0,
clamp(global.volume*(sprite_width/100),slw/2,sprite_width-slw/2)*(1-vertical)+(sprite_width)*(vertical),
(sprite_height-clamp(global.volume*(sprite_height/100),slh/2,sprite_height-slh/2))*vertical+(sprite_height*(1-vertical)),
x,y,1,1,slidercol2,1)

draw_sprite_ext(global.__ico_volholder,0,x+clamp(global.volume*(sprite_width/100),slw/2,sprite_width-slw/2)*(1-vertical)+(sprite_width/2)*vertical,y+(sprite_height-clamp(global.volume*(sprite_height/100),slh/2,sprite_height-slh/2))*vertical+(sprite_height/2)*(1-vertical),1,1,0,holdercol,1)
if can=0 press=0
