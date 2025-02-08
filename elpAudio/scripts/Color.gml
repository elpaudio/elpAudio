///(color name,[value])
if argument_count==1
    return dsmap(global.color_map,argument0)
if argument_count==2
    dsmap(global.color_map,argument0,argument[1])
