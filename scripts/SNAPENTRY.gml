var v;v=argument0
if global.paused or global.stopped {
if __visualiser>0 return abs(lengthdir_x(1,current_time*0.05+v))
return lengthdir_x(1,current_time*0.05+v)
}
else {
if global.wave=1 return (ord(string_char_at(global.FMODbuf,argument0))/127)-1
return ord(string_char_at(global.FMODbuf,argument0))/255
}
