#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
x=global.visx
y=global.visy
width=global.visw
height=global.vish

//taken from Visual Music and fixed for elpAudio
if global.play and !global.paused and !global.stopped and __FrameSkip{
//FMODUpdateTakeOverWhileLocked()
sleep_ext(__millisecs)
//FMODUpdateTakeOverDone()
}
/*/

draw_set_alpha(1)

if usebgvisimg==0 {
    n=1
} else {
    if sprite_exists(visbgimg) and visbgimg>-1 {
        draw_sprite_stretched_ext(visbgimg,0,x+visbgx,y+visbgy,visbgw,visbgh,Color('vis_bg'),1)
    }
}

event_user(0) //draws visualisers

draw_set_color(c_white)

if usefgvisimg {
    if sprite_exists(visfgimg) and visfgimg>-1 {
        draw_sprite_stretched_ext(visfgimg,0,x+visfgx,y+visfgy,visfgw,visfgh,Color('vis_fg'),1)
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
