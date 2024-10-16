///(fname)
var artist,name;

name=string(MetadataGetTag('TITLE'))
artist=string(MetadataGetTag('ARTIST'))

if name+artist='??' or name+artist='00'
or string_length(name+artist)=0
or name+artist=''
or string_lettersdigits(name+artist)=''
return FilterString(argument0)

return artist+' - '+name
