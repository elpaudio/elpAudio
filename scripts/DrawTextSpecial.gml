return draw_text(argument0,argument1,
string_copy(argument2,0,
128*(1-(string_length(argument2)>argument3))+((argument3-3)*(string_length(argument2)>argument3)))
+string_repeat('...',string_length(argument2)>argument3))
