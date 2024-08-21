///(button,event,codestr)
var a0,a1,a2;a0=argument0;a1=argument1;a2=argument2;

if string_lower(a1)=='create' object_event_add(a0,ev_create,0,a2)
if string_lower(a1)=='step' object_event_add(a0,ev_step,ev_step_normal,a2)
if string_lower(a1)=='draw' object_event_add(a0,ev_draw,0,a2)
return 1
