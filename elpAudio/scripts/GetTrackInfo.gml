global.songartist=''
global.songtitle=''
global.songnumber=''
global.songalbum=''
global.songgenre=''
global.songyear=''

var res; res = FMODInstanceGetNextTag(argument0)
var tag;
var mydata;
var me;me=filename_ext(ds_list_find_value(global.list,global.current))
while(res){if(res = 1){
    tag=string_lettersdigits(string_upper(FMODGetTagName()))

    mydata=string_replace_all(string(FMODGetTagData()),'#','//');
    show_message(tag)
    show_message(mydata)

    if tag == "TITLE" then
        global.songtitle = mydata
    else
    if tag == "ARTIST" then
        global.songartist = mydata
    else
    if tag=="ALBUM" then
        global.songalbum=mydata
    else
    if tag=="YEAR" or tag=='DATE' then
        global.songyear=mydata
    else
    if tag=="TRACK" then
        global.songnumber=mydata
    else if tag=="TRACKNUMBER" then
        global.songnumber=string_copy(mydata,1,string_pos('/',tag)-1)
    else
    if tag=="GENRE" or tag=="TCON" then
        if string_digits(mydata)==mydata then
            global.songgenre=GetSongGenre(mydata);
        else
            global.songgenre=mydata;
    }
    res = FMODInstanceGetNextTag(argument0)
}
