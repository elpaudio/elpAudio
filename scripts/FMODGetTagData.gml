//export double FMODGetTagData()
//Gets the tag data from a stream
//Refer to Visual Music Demo
var buf;
buf = string_repeat(chr(0), 2048);
var len;
len = external_call(global.dll_FMODGetTagData,buf);
return "" + string_copy(buf,1,len);/*/

/*
var buf;
buf = buffer_create()
buffer_set_size(buf,2048)
var len;
len = external_call(global.dll_FMODGetTagData,buf);
var ret;
ret=""+buffer_read_string(buf)
buffer_destroy(buf)
return ret*/
