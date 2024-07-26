var b,i;i=0
b=buffer_create()
buffer_load(b,argument0)
buffer_set_pos(b,0)
s3mname=string_copy(buffer_read_string(b),0,28)
repeat 29 {if string_copy(s3mname,28-i,1)==' ' {s3mname=string_delete(s3mname,28-i,1)i+=1}}
buffer_destroy(b)
if s3mname='' then return FilterString(argument0)
return s3mname
