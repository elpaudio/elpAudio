var mf;mf=argument0;
if is_real(mf) return -1;
var mm;
if mf='default' mm=fntCaption
if mf='floater' mm=fntVisual
return draw_set_font(mm)
