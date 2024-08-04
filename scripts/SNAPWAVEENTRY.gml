var _v,vf;_v=argument0;vf=argument1;
if global.paused or global.stopped {
return lengthdir_x(1,current_time*0.05+_v)*0.98
}
else {
var i,myk,myres;i=0;myres=0;myk=0;
repeat(round(256/vf)) {
if string_ord_at(global.FMODbuf,(_v*round(256/vf))+i)>round(256/vf) {myres+=string_ord_at(global.FMODbuf,(_v*round(256/vf))+i) myk+=1}
i+=1
}
return (myres/max(myk,1))/255
}
