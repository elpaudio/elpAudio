///sini_open(fname,write_or_read)
/*var f,h;
globalvar __sini__file;
f=argument0
h=string(argument1)
if h='0' or h='w' __sini__file=file_text_open_write(f)
if h='1' or h='r' __sini__file=file_text_open_read(f)
return __sini__file
