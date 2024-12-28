///(file) -> bool
if string_pos(string_lower(filename_ext(argument0)),__fformats) return true
// Above is the best way to check the file if it's supported.
// Will allow files to be added into playlists, but can add files like .c, .b, .h and other similar.
// Below is the worst way to check the file if it's supported.
// Will not allow files to add into playlist, or it will be looped until forever.
/*
var ext;ext=string_lower(filename_ext(argument0))
i=0 repeat(string_length(__fformats)) {
if string_copy(__fformats,i,string_length(ext))==ext {return true;break}
i+=1
}
*/
return false
