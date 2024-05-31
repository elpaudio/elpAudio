var __hello,__h;__hello=0
if argument_count==1 return string(argument0)
else if argument_count<1 show_error('string_ext() - no arguments given.',0) else {
__h=string(argument0)
repeat(argument_count-1) {
__h=string_replace_all(__h,"{"+string(__hello)+"}",string(argument[__hello+1]))
__hello+=1
}
return __h;
}
