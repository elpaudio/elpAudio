///(list,pos_from,pos_to)
var s;s=ds_list_find_value(argument0,argument2)
ds_list_replace(argument0,argument2,ds_list_find_value(argument0,argument1))
ds_list_replace(argument0,argument1,s)
return 1;
