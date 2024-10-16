var h;
if string_count('.',argument0)==1 return string_copy(argument0,string_pos('.',argument0),128) else {
var count;count=string_count('.',argument0)
if count==0 return '' else {
var hh;
hh=argument0
repeat(count-1) {
hh=string_replace(hh,'.','')
}
return string_copy(hh,string_pos('.',hh),128)
}
}
