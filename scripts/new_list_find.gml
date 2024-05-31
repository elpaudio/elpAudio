///(list,pos)
var index;
if argument1<0 return global.__index[argument0,0]
index=global.__index[argument0,argument1]
if is_undefined(index) return '-1'
return index
