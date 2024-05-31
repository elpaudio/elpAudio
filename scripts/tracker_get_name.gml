if string_ends_with(string_lower(argument0),'.xm') {
return string_replace_all(xm_load(argument0),"#",'//');}
if string_ends_with(string_lower(argument0),'.mod') {
return string_replace_all(mod_load(argument0),"#",'//');}
if string_ends_with(string_lower(argument0),'.s3m') {
return string_replace_all(s3m_load(argument0),"#",'//');}
if string_ends_with(string_lower(argument0),'.it') {
return string_replace_all(it_load(argument0),"#",'//');}
