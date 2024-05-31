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
/*
if !surface_exists(surf1) {
surf1=surface_create(width,height)
}
if !surface_exists(surf2) {
surf2=surface_create(width,height)
}
if global.play {
if __visualiser=0 {
surface_copy(surf2,0,0,surf1)
surface_set_target(surf1)
if __enablevisdist {draw_clear_alpha(global.visbgcol,0.8)
draw_surface_ext(surf2,0,0,1,1,0,c_white,0.97)}
else draw_clear_alpha(0,0)
snapinstance(myinst,0,0,width,height)
surface_reset_target()
}
}*/
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

draw_set_color(global.visbgcol)
draw_set_alpha(1)

if usebgvisimg==0 {
n=1
//draw_rectangle(x,y,x+width,y+height,0)
} else {
if sprite_exists(visbgimg) and visbgimg>-1 {
draw_sprite_stretched_ext(visbgimg,0,x+visbgx,y+visbgy,visbgw,visbgh,c_white,1)
}
}

draw_set_color(c_white)

if !surface_exists(surf1) {
surf1=surface_create(width,height)
}
if !surface_exists(surf2) {
surf2=surface_create(width,height)
}
var hhh;hhh=5
if global.play {
/*if __visualiser==0 draw_surface_ext(surf1,x,y,1,1,0,c_white,1)
if __visualiser==1 visualise2(myinst,x+width/2,y+height/2,width,height)
if __visualiser==2 visualise3(myinst,x,y,width,height)
if __visualiser==3 visualise4(myinst,x,y,width,height)
if __visualiser==4 visualise5(myinst,x,y,width,height)
if __visualiser==5 visualise6(myinst,x,y,width,height)*/
i=0 repeat(global.customvisuals) {
if __visualiser==i execute_string(global.vis[i])//(working_directory+'\visualisers\vis_'+string(i)+'.gml')
i+=1
}
}

if usefgvisimg {
if sprite_exists(visfgimg) and visfgimg>-1 {
draw_sprite_stretched_ext(visfgimg,0,x+visfgx,y+visfgy,visfgw,visfgh,c_white,1)
}
}
if turnon {
draw_set_color($FFFFFF-draw_getpixel(x,y))
draw_text(x+1,y+1,string_ext('{0}/{1}',fps,room_speed))}
#define KeyPress_120
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
turnon=!turnon
