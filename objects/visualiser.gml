#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=random(1000)
xx=0
myh=0
turnon=0

wait=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if wait>0 wait-=1 else wait=2
if global.play myinst=global.playing
else myinst=noone
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=global.visualx
y=global.visualy
width=global.visualw
height=global.visualh

//taken from Visual Music and fixed for elpAudio
if global.play and !global.paused and !global.stopped {
//FMODUpdateTakeOverWhileLocked()
sleep_ext(20)
//FMODUpdateTakeOverDone()
}
/*/

draw_set_color(global.visbgcol)
draw_set_alpha(1)

if usebgvisimg==0 {
    n=1
} else {
    if sprite_exists(visbgimg) and visbgimg>-1 {
        draw_sprite_stretched_ext(visbgimg,0,x+visbgx,y+visbgy,visbgw,visbgh,c_white,1)
    }
}

draw_set_color(c_white)

if usefgvisimg {
    if sprite_exists(visfgimg) and visfgimg>-1 {
        draw_sprite_stretched_ext(visfgimg,0,x+visfgx,y+visfgy,visfgw,visfgh,c_white,1)
    }
}
if turnon {
    draw_set_color(c_black)
    draw_text(x+1,y+1,string_ext('{0}/{1}',fps,room_speed))
}
#define KeyPress_120
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_direct(vk_control) turnon=!turnon
