///(w,h,center,[adapt])
view_wview=argument0
view_hview=argument1
view_wport=argument0
view_hport=argument1
window_set_size(argument0,argument1)
window_set_region_scale(1,0)
if argument_count==3 window_set_region_size(argument0,argument1,1)
if argument_count==4 window_set_region_size(argument0,argument1,argument[3])
window_resize_buffer(argument0,argument1,0,0)
if argument2 window_center()
