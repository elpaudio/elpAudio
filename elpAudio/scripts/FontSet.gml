var mf;mf=argument0;
if is_real(mf) return -1;
var mm;
if mf='default' mm=global.__fon_cap
if mf='floater' mm=global.__fon_vis
return draw_set_font(mm)
