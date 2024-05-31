///(x,y,w,h,GM_WINDOW flags,bg_color)
/*
Return windows ID on success;
returns -1 if cannot create window;
returns -2 if cannot create renderer;
return -3 if already max windows

*/

return external_call(global._sdl_wincreate,argument0,argument1,argument2,argument3,argument4,argument5)
