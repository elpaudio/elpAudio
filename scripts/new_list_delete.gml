///(list,pos)
global.__index[argument0,argument1]=''
var i;i=0
repeat(global.__newlisti-argument1) {
global.__index[argument0,argument1+i]=global.__index[argument0,argument1+1+i]
i+=1
}
global.__newlisti[argument0]-=1
