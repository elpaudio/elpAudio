#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=global.__ico_slid2
image_blend=__butslidecol
pr=0
press=0
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
if !window_get_active() exit
can=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
//can=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
slw=sprite_get_width(global.__ico_slide)

if point_in_rectangle(mouse_x,mouse_y,-pr*100+x,y-pr*10,pr*100+x+sprite_width,y+sprite_height+pr*10) and press {
    if mouse_check_button(mb_left) then {
        myx=clamp(mouse_x+slw/2,x+slw/2,x+sprite_width-slw/2)
        pr=1
    } else {
        myx=round(clamp(x+global.pos*sprite_width+slw/2,x+slw/2,x+sprite_width-slw/2))
        pr=0
        }
} else
    myx=round(clamp(x+global.pos*sprite_width+slw/2,x+slw/2,x+sprite_width-slw/2))

draw_self()
draw_sprite_part_ext(sprite_index,1,0,0,myx-x,sprite_height,x,y,1,1,c_white,1)

draw_sprite_ext(global.__ico_slide,0,myx,y+sprite_height/2,1,1,0,__butslidercol,1)


if !window_get_active() exit

if point_in_rectangle(mouse_x,mouse_y,-pr*100+x,y-pr*10,pr*100+x+sprite_width,y+sprite_height+pr*10)
and global.play and press then {
    mypos=clamp(mouse_x-x,0,sprite_width)
    if mouse_check_button_released(mb_left) then {
        FMODInstanceSetPosition(global.playing,(mypos)/(sprite_width))
        press=0
        }

    mx1=4
    mx2=100
    tx=10
    if mouse_x+100>view_wview {mx1=-4 mx2=-100 tx=-96}
    draw_set_color(c_white)
        draw_rectangle(mouse_x+mx1,mouse_y-24,mouse_x+mx2,mouse_y-4,0)
    draw_set_color(c_black)
        draw_rectangle(mouse_x+mx1,mouse_y-24,mouse_x+mx2,mouse_y-4,1)
    draw_set_font(global.__fon_cap)
        draw_text(mouse_x+tx,mouse_y-22,current_time_format2( ((mypos)/(sprite_width))*global.songlength) )
    draw_set_color(c_white)
}
if pr=0 press=0
