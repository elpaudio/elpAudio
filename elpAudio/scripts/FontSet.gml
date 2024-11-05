var mf;mf=argument0;
if is_real(mf) return -1;
var mm;
mm=-1;
if mf='default' mm=global.__fon_cap
if mf='floater' mm=global.__fon_vis
if mf='custom' and argument_count==2 mm=argument[1]
return draw_set_font(mm)
