ds_map_clear(global.metatags);
var res; res = FMODInstanceGetNextTag(argument0)
var tag;
var mydata;
var me;me=filename_ext(ds_list_find_value(global.list,global.current))
while(res){if(res = 1){
    tag=string_lettersdigits(string_upper(FMODGetTagName()))

    mydata=string_replace_all(string(FMODGetTagData()),'#','//');

    ds_map_set(global.metatags,tag,mydata);
    }

    res = FMODInstanceGetNextTag(argument0)
}
if ds_map_exists(global.metatags,'TITLE') ds_map_duplicate(global.metatags,'TITLE','TRACK')
else if ds_map_exists(global.metatags,'TRACK') ds_map_duplicate(global.metatags,'TRACK','TITLE')

if ds_map_exists(global.metatags,'DATE') ds_map_duplicate(global.metatags,'DATE','YEAR')
else if ds_map_exists(global.metatags,'YEAR') ds_map_duplicate(global.metatags,'YEAR','DATE')