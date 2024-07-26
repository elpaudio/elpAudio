var b;
b=buffer_create()
buffer_load_part(b,argument0,0,256)
buffer_set_pos(b,0)
var h,i;
i=0
h=buffer_read_string(b)
xmname=string_copy(h,18,20)
//show_message(string_replace_all(xmname,' ','|'))
repeat 21 {if string_copy(xmname,20-i,1)==' ' {xmname=string_delete(xmname,20-i,1)i+=1}}
buffer_destroy(b)
if xmname='' then return FilterString(argument0)
return xmname
