///(section,key,value_if_not_exists,[real])
var __file,__sec,__key,__a,__pos,__i,__ii;
__i=0
__ii=0
__pos=1
__sec=argument0
__key=string(argument1)
__a=argument2
__file=file_text_open_read(global.__linifile)
while !file_text_eof(__file)
{
__mystr=file_text_read_string(__file)
//show_message(string_copy(mystr,1,string_length('['+sec+']')))
if string_copy(__mystr,1,string_length('['+__sec+']'))=='['+__sec+']' {___key[__i,__i]='['+__sec+']' __i+=1}
//show_message(string_copy(mystr,1,string_length(key+'=')))
if string_copy(__mystr,1,string_length(__key+'='))=__key+'='
{//__key[i,ii]=string_copy(mystr,string_length(key+'=')+1,256)
__ret=string_copy(__mystr,string_length(__key+'=')+1,256)
if argument_count==4 {if argument[3] __ret=real(string_digits(__ret))}
file_text_close(__file)
return __ret //__key[i,ii]
exit __ii+=1}

__pos+=1
file_text_readln(__file)
}
file_text_close(__file)
return __a
