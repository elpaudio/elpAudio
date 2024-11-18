///draw_text_blur(x,y,str,xscale,yscale,angle)
var t;t=0
draw_set_alpha(0.02)
repeat(25) {
    draw_text_transformed(argument0+t/10,argument1,argument2,argument3,argument4,argument5)
    draw_text_transformed(argument0-t/10,argument1,argument2,argument3,argument4,argument5)
    draw_text_transformed(argument0,argument1+t/10,argument2,argument3,argument4,argument5)
    draw_text_transformed(argument0,argument1-t/10,argument2,argument3,argument4,argument5)
    t+=1
}
draw_set_alpha(1)
