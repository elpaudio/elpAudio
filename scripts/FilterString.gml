var h
{h=string(argument0)}

h=string_replace(h,filename_ext(h),'')
h=string_replace(h,filename_path(h),'')
h=string_replace_all(h,'#','//')
return h
