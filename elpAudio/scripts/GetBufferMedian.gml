var i,myres,h;h=0;i=0;myres=0; repeat(argument0) {
if string_ord_at(global.FMODbuf,(argument0*round(256/argument1))+i)>round(256/argument1) {myres+=string_ord_at(global.FMODbuf,(argument0*round(256/argument1))+i); h+=1;}
i+=1;
}
return myres/max(h,1);
