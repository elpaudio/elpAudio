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
tag=FMODGetTagName()

if tag == "TITLE" then
global.songtitle = string_replace_all(string(FMODGetTagData()),'#','//');
else
if tag == "ARTIST" then
global.songartist = string_replace_all(string(FMODGetTagData()),'#','//');
else
if tag=="ALBUM" then
global.songalbum=string_replace_all(string(FMODGetTagData()),'#','//');
else
if tag=="YEAR" then
global.songyear=string_replace_all(string(FMODGetTagData()),'#','//');
else
if tag=="TRACK" then
global.songnumber=string_replace_all(string(FMODGetTagData()),'#','//');
else
if tag=="GENRE" or tag=="TCON" then
global.songgenre=GetSongGenre(string(FMODGetTagData()));

//else if tag=="APIC" then global.songimg=string(FMODGetTagData());

}
    res = FMODInstanceGetNextTag(argument0)
}
