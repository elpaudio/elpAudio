var b,i;i=0
b=buffer_create()
buffer_load_part(b,argument0,0,256)
buffer_set_pos(b,0)
itname=string_replace_all(string_copy(buffer_read_string(b),0,28),'IMPM','')
repeat 29 {if string_copy(itname,28-i,1)==' ' {itname=string_delete(itname,28-i,1)i+=1}}
if itname='' then return filter(argument0)
buffer_destroy(b)
return itname
