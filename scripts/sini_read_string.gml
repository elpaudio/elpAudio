///readstr(section,key,sample)
/*
if !file_exists(__sini__file) return ''
var s,k,sa,read,n;
n=''
while !file_text_eof(__sini__file) {
read+=string(file_text_read_string(__sini__file))+"|||||||||"
file_text_readln(__sini__file)
}
s=string_pos('['+argument0+']',read)
k=string_pos(argument1+'=',read)
sa=argument2
if s='' return sa;
if k='' return sa;
i=0
while string_char_at(read,k+i+1)!="|||||||||" {
n+=string_copy(read,k+i+1,1)
i+=1
}
return n;
