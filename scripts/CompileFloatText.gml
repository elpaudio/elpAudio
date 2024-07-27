
var artist,name;

name=global.songtitle
artist=global.songartist

if name+artist='??'
or string_length(name+artist)=0
or name+artist=''
or string_lettersdigits(name+artist)=''
return FilterString(argument0)

return artist+' - '+name
