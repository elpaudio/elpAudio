///(font_var,font_fname,font_name,frames,remove_bg,smooth,xoff,yoff)
if argument0>0 {
if font_exists(argument0) {font_delete(argument0) font_add_file(argument1,argument2,argument3,argument4,argument5,argument6,argument7) return 1}
else {return font_add_file(argument1,argument2,argument3,argument4,argument5,argument6,argument7)}
} else {return font_add_file(argument1,argument2,argument3,argument4,argument5,argument6,argument7)}
