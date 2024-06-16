var dg;dg=draw_get_color()
if point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+w,yy+h) {
var they;they=clamp(floor((mouse_y-yy)/myfonth)+_rolled,0,GetListSize()-1)
draw_set_color(c_gray*(1-mouse_check_button(mb_any))+c_dkgray*mouse_check_button(mb_any))
DrawRectOutline(xx,yy+((they-_rolled)*myfonth),xx+width,yy+((they-_rolled)*myfonth)+myfonth)
if mouse_check_button_released(mb_any) and _sel!=they {_sel=they global.current=they ea_play(_sel)}
}
draw_set_color(c_aqua)
if i+_rolled=_sel DrawRectOutline(xx,yy+i*myfonth,xx+width,yy+i*myfonth+myfonth)
draw_set_color(dg)
