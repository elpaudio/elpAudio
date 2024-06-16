global.songartist=''
global.songtitle=''
global.songnumber=''
global.songalbum=''
global.songimg=''
global.songgenre=''
global.songyear=''

var res; res = FMODInstanceGetNextTag(argument0)
var tag;
while(res)
{
if(res = 1)
{
tag =FMODGetTagName()
//show_message(tag)
if  tag == "TITLE" /*or tag='TRK' or tag='TT2' or tag='TIT2' */global.songtitle = string(FMODGetTagData());
else if tag == "ARTIST"/* or tag='TP1' or tag='TPE1'*/ global.songartist = string(FMODGetTagData());
else if tag=="ALBUM"/* or tag=="TALB"*/ global.songalbum=string_replace_all(string(FMODGetTagData()),'#','//');
else if tag=="YEAR"/* or tag='TYE' */global.songyear=string_replace_all(string(FMODGetTagData()),'#','//');
else if tag=="TRACK"/* or tag='TRCK' */global.songnumber=string_replace_all(string(FMODGetTagData()),'#','//');
else if tag=="GENRE"/* or tag=="TCON"*/ {
if tag=="GENRE" global.songgenre=get_genre(string(FMODGetTagData()));
else if tag=="TCON" global.songgenre=get_genre(string(FMODGetTagData()));}

else if tag=="APIC" global.songimg=string(FMODGetTagData());

//show_message(string(FMODGetTagData()));
}
    res = FMODInstanceGetNextTag(argument0)
}

/*if string_length(global.songimg)>0 {var b;b=buffer_create();i=0;repeat(string_length(global.songimg)){buffer_write_u8(b,string_char_at(global.songimg,i+1))i+=1;};buffer_save(b,'test.jpg');buffer_destroy(b)}
myimg=-1
if file_exists('test.jpg') myimg=sprite_add('test.jpg',1,0,0,0,0)*/
//show_message(string_ext('Title:{0}#Artist:{1}#Album:{2}#Year:{3}#Track number:{4}#Genre:{5}',global.songtitle,global.songartist,global.songalbum,global.songyear,global.songnumber,global.songgenre))
