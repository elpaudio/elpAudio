///(list,pos_from,pos_to)
var s;s=dslist(argument0,argument2)
ds_list_replace(argument0,argument2,dslist(argument0,argument1))
ds_list_replace(argument0,argument1,s)
return 1;
