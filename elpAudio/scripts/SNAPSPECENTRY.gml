//*
do_nothing(argument1)
return SnapSpecEntry2(argument0)

/* /
var _v,vf;_v=argument0;vf=argument1
if global.paused or global.stopped {
return 0.5+lengthdir_x(0.5,current_time*0.05+_v)
}
else {
//if visualiser.wait>0 exit
var i,myk,myres;i=0;myres=0;myk=0;
repeat(round(256/vf)) {
if string_ord_at(global.FMODbuf,(_v*round(256/vf))+i)>round(256/vf) {myres+=string_ord_at(global.FMODbuf,(_v*round(256/vf))+i) myk+=1}
i+=1
}
//myres/=floor(256/__visual_freq)//__visual_freq
return (myres/max(myk,1))/240
}
/*/
