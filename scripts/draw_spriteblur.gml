///draw_spriteblur(spr,index,x,y,xscale,yscale,rot,col)
var t;t=0
draw_set_alpha(0.02)
repeat(25) {
draw_sprite_ext(argument0,argument1,argument2+t/10,argument3,argument4,argument5,argument6,argument7,draw_get_alpha())
draw_sprite_ext(argument0,argument1,argument2-t/10,argument3,argument4,argument5,argument6,argument7,draw_get_alpha())
draw_sprite_ext(argument0,argument1,argument2,argument3+t/10,argument4,argument5,argument6,argument7,draw_get_alpha())
draw_sprite_ext(argument0,argument1,argument2,argument3-t/10,argument4,argument5,argument6,argument7,draw_get_alpha())
t+=1
}
draw_set_alpha(1)
