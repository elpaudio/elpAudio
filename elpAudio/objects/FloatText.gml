#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
alarm[0]=30
drawstr=''
mystr='WELCOME ! '
stri=0
xx=0
sprite_index=global.__floatbg
surf=surface_create(oldfloatw,40)
bgcol=c_white
fgcol=c_white
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///OLD FLOAT TEXT
if global.oldfloat==1 and global.pstate!=EA_NONE {
        if floatdrawtime1 { // Draw with time
            mystr=string_repeat(string_repeat('('+string(global.current+1)+'/'+string(global.list_size)+') ',drawcursong)+global.trackname+' ('+global.formatted_time+')   ***   ',6)
        } else { // Draw without time
            mystr=string_repeat(string_repeat('('+string(global.current+1)+'/'+string(global.list_size)+') ',drawcursong)+global.trackname+'   ***   ',6)
        }
draw_set_font(global.__fon_vis)
xx-=string_width('A')
if xx<-string_width(mystr)/2 xx=0
}
alarm[0]=(((15/__speed)*(max(fps,30)/60))*20) //hardcoded
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !surface_exists(surf)
    surf=surface_create(oldfloatw,40)

draw_set_font(global.__fon_vis)

//draws text to surface and then that surface is drawing in "Draw"
surface_set_target(surf)
draw_clear_alpha(0,0)
draw_set_color(Color('float_text'))
draw_set_halign(fa_left*(1-text_centered)+fa_center*text_centered)
draw_text_transformed(xx+text_centered*width/2+textx,6+texty,mystr,1,1,0)
surface_reset_target()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(global.__fon_vis)

if usebgimg and sprite_exists(global.__floatbg) and global.__floatbg>0
    draw_sprite_stretched_ext(global.__floatbg,0,x,y,width,height,Color('float_bg'),1)


draw_set_color(Color('float_text'))
draw_set_halign(fa_left)

if global.oldfloat==0 and global.pstate!=EA_NONE {

    if instance_exists(Visualiser) and ontop==0 then
        Visualiser.depth=depth-1

    if floatdrawtime1 and !ds_list_empty(global.list) then
    { // Draw with time
        mystr=global.trackname+' ('+global.formatted_time+')'
    }
    else
    { // Draw without the time
        mystr=global.trackname
    }

    if floatiertext {
        if textx+string_width(mystr)+16>width then
        xx-=((__speed)/15)*(room_speed/max(fps,30))
    }

    if xx<-string_width(mystr)-textx then
        xx=width+10+text_centered*width/2+textx
}

// Draws text
    draw_surface_ext(surf,x+surfx,y+surfy,1,1,0,c_white,1)

if drawfloattime2 {
    draw_set_font(time2font)
    draw_set_color(floattime2col1)
    draw_text(x+time2x,y+time2y,"88:88")
    draw_set_color(floattime2col2)

    if global.pstate!=EA_NONE then
        draw_text(x+time2x,y+time2y,global.formatted_cur_pos)
    else
        draw_text(x+time2x,y+time2y,"00:00")

}

if drawqueue {
    draw_set_font(queuefont)
    draw_set_color(queuecol1)
    draw_text(x+queuex,y+queuey,string_ext('{0}/{1}',string_repeat('8',string_length(string(global.current+1))),string_repeat('8',string_length(string(global.list_size)))))
    draw_set_color(queuecol2)
    draw_text(x+queuex,y+queuey,string(string_pad(global.current+1,2))+'/'+string(string_pad(global.list_size,2)))
}

if usefgimg and sprite_exists(global.__floatfg)
and global.__floatfg>0 then
    draw_sprite_stretched_ext(global.__floatfg,0,x,y,width,height,Color('float_fg'),1)
