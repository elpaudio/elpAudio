///(spr_var,spr_fname,frames,remove_bg,smooth,xoff,yoff)
if argument0>0 {
if sprite_exists(argument0) {sprite_replace(argument0,argument1,argument2,argument3,argument5,argument5,argument6) return 1}
else {return sprite_add(argument1,argument2,argument3,argument4,argument5,argument6)}
} else {return sprite_add(argument1,argument2,argument3,argument4,argument5,argument6)}
