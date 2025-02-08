MetadataClear()
var res; res = FMODInstanceGetNextTag(argument0)
var tag;
var mydata;
while(res){if(res = 1){
    tag=string_lettersdigits(string_upper(FMODGetTagName()))

    mydata=string_replace_all(string(FMODGetTagData()),'#','//');

    dsmap(global.metatags,tag,mydata);
    }

    res = FMODInstanceGetNextTag(argument0)
}
var ext;ext=filename_ext(dslist(global.list,global.current))
if string_lower(ext)=='.mp3' {
    if ds_map_exists(global.metatags,'TRACK') then
        ds_map_duplicate(global.metatags,'TRACK','TRACKNUMBER') //TRACK in MP3s is track number
} else {
    //if !ds_map_exists(global.metatags,'TITLE') then
        ds_map_duplicate(global.metatags,'TRACK','TITLE') //TRACK in FLACs is title
}
if ds_map_exists(global.metatags,'GENRE') {
    mygenre=string(MetadataGetGenre(ds_map_get(global.metatags,'GENRE')))
    dsmap(global.metatags,'GENRE',mygenre)
}

if ds_map_exists(global.metatags,'DATE') ds_map_duplicate(global.metatags,'DATE','YEAR')
else if ds_map_exists(global.metatags,'YEAR') ds_map_duplicate(global.metatags,'YEAR','DATE')

dsmap(global.metatags,'FORMAT',ext)
dsmap(global.metatags,'CHANNELS',FMODSoundGetNumChannels(global.musicsound))
