var b,h,i,modname;
b=buffer_create()
buffer_load_part(b,argument0,0,256)
buffer_set_pos(b,0)
i=0
h=buffer_read_string(b)
modname=string_copy(h,0,20)
repeat 21 {if string_copy(modname,20-i,1)==' ' {modname=string_delete(modname,20-i,1)i+=1}}
buffer_destroy(b)
if modname='' then return FilterString(argument0)
return modname
