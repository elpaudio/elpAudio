/*if file_is_tracker(global.thesong)
begin
if string_ends_with(string_lower(global.thesong),'.xm') {xm_load(global.thesong)
return real(xmlen)*1000*((xmpatterns-1))}
if string_ends_with(string_lower(global.thesong),'.mod') {mod_load(global.thesong)
return real(real_hex(modlen))*1000*((modpatterns-1))}
if string_ends_with(string_lower(global.thesong),'.s3m') {xm_load(global.thesong)
return real(real_hex(s3mlen))*1000*((xmpatterns-1))}
end
else*/
return(FMODSoundGetLength(argument0))
