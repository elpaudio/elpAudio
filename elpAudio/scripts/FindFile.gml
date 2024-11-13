///(path with '\',ext1,[ext2,ext3,ext4,ext5,ext6,...]) -> founded file (EXTS WITHOUT '*'!!!!)
var ff,e1;
ff=argument0
e1=argument1
var str;str=''
var f;f=''
if !string_ends_with(ff,'\') ff+='\'
var i;i=1 repeat(argument_count-1) {
str=ff+argument[i]
f=file_find_first(str,fa_hidden+fa_readonly);
if f!='' {file_find_close() return ff+f}
i+=1;
}
return '';
