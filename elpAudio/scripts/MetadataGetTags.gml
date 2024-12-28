MetadataClear()
var res; res = FMODInstanceGetNextTag(argument0)
var tag;
var mydata;
while(res){if(res = 1){
    tag=string_lettersdigits(string_upper(FMODGetTagName()))

    mydata=string_replace_all(string(FMODGetTagData()),'#','//');

    ds_map_set(global.metatags,tag,mydata);
    }

    res = FMODInstanceGetNextTag(argument0)
}
var ext;ext=filename_ext(ds_list_find_value(global.list,global.current))
if string_lower(ext)=='.mp3' {
    if ds_map_exists(global.metatags,'TRACK') then
        ds_map_duplicate(global.metatags,'TRACK','TRACKNUMBER') //TRACK in MP3s is track number
} else {
    //if !ds_map_exists(global.metatags,'TITLE') then
        ds_map_duplicate(global.metatags,'TRACK','TITLE') //TRACK in FLACs is title
}
if ds_map_exists(global.metatags,'GENRE') {
    mygenre=string(MetadataGetGenre(ds_map_get(global.metatags,'GENRE')))
    ds_map_set(global.metatags,'GENRE',mygenre)
}

if ds_map_exists(global.metatags,'DATE') ds_map_duplicate(global.metatags,'DATE','YEAR')
else if ds_map_exists(global.metatags,'YEAR') ds_map_duplicate(global.metatags,'YEAR','DATE')

ds_map_set(global.metatags,'FORMAT',ext)
ds_map_set(global.metatags,'CHANNELS',FMODSoundGetNumChannels(global.musicsound))
