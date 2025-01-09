if !global._focused exit
if point_in_rectangle(
    display_mouse_get_x(),display_mouse_get_y(),
    window_get_x()+x-1000*pressed,window_get_y()+y-1000*pressed,
    window_get_x()+x+w-w/6+1000*pressed,window_get_y()+y+h+1000*pressed
)
{
if mouse_check_direct(mb_left) {
if hh=0 {
mx=mouse_x
my=mouse_y
xonb=0
yonb=0
if xftime=0 xftime=1
if yftime=0 yftime=1
hh=1
}
if xftime=1 then xonb=0
if yftime=1 then yonb=0



///WINDOW STICKS TO EDGES
if (display_mouse_get_x()-mx<=-global.realwidth+display_get_width()+16 or display_mouse_get_y()-my<=-global.realheight+display_get_height()+16
or display_mouse_get_x()-mx+view_wport>=global.realwidth-16 or display_mouse_get_y()-my+view_hport>=global.realheight-16)
and __stick_to_edges
{
    if display_mouse_get_x()-mx<=-global.realwidth+display_get_width()+16 then
        wx=-global.realwidth+display_get_width()
    else
    if display_mouse_get_x()-mx+view_wport>=global.realwidth-16 then
        wx=global.realwidth-view_wport
    else
        wx=display_mouse_get_x()-mx

    if display_mouse_get_y()-my<=-global.realheight+display_get_height()+16 then
        wy=-global.realheight+display_get_height()
    else
    if display_mouse_get_y()-my+view_hport>=global.realheight-16 then
        wy=global.realheight-view_hport
    else
        wy=display_mouse_get_y()-my
    }
    else {
        wx=display_mouse_get_x()-mx
        wy=display_mouse_get_y()-my
    }

    window_set_position(wx,wy)

    pressed=1
    } else {pressed=0 hh=0}
}
