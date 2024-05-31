var artist,name;

name=global.songtitle
artist=global.songartist

if name+artist='??' or name+artist='' return filter(argument0)

return artist+' - '+name

//return filter(argument0)





exit
/*
var b,h,trackname,artist,tracknum,album,offset,i;
off=8
b=buffer_create()
h=''
size=4096
buffer_load_part(b,argument0,0,size)
i=0
repeat(size) {
h+=buffer_read_string(b)
}
//show_message(h)
off1=0
off2=8
digitoff=0

realoff=ord(string_copy(h,4,1))
if realoff=3 {
off1=0
off2=8
digitoff=0
}
if realoff=4 {
off1=-2
off2=6
digitoff=1
}

h=string_replace_all(h,chr(10),'')
h=string_replace_all(h,chr(13),'')

trck=string_pos('TRCK',h)+off+off1-digitoff
tit2=string_pos('TIT2',h)+off+off1
tpe1=string_pos('TPE1',h)+off+off1
txxx=string_pos('TXXX',h)+off+off1
talb=string_pos('TALB',h)+off+off1
tyer=string_pos('TYER',h)+off+off1
tdrc=string_pos('TDRC',h)+off+off1
tottrck=string_pos('TOTALTRACKS',h)+off+off1

//ALBUM
if talb<tdrc {
album=string_copy(h,talb,tdrc-talb-off2)
} else
if talb<trck {
album=string_copy(h,talb,trck-talb-off2)
} else
if talb<tit2 {
album=string_copy(h,talb,tit2-talb-off2)
} else
if talb<tpe1 {
album=string_copy(h,talb,tpe1-talb-off2)
} else
if talb<tyer {
album=string_copy(h,talb,tyer-talb-off2)
} else
album=string_copy(h,talb,txxx-talb-off2)

//TRACK NAME
if tit2<tpe1 {
trackname=string_copy(h,tit2,tpe1-tit2-off2)
} else
if tit2<trck {
trackname=string_copy(h,tit2,trck-tit2-off2)
} else
if tit2<talb {
trackname=string_copy(h,tit2,talb-tit2-off2)
} else
if tit2<tyer {
trackname=string_copy(h,tit2,tyer-tit2-off2)
} else
trackname=string_copy(h,tit2,txxx-tit2-off2)

//artist
if tpe1<tit2 {
artist=string_copy(h,tpe1,tit2-tpe1-off2)
} else
if tpe1<trck {
artist=string_copy(h,tpe1,trck-tpe1-off2)
} else
if tpe1<talb {
artist=string_copy(h,tpe1,talb-tpe1-off2)
} else
if tpe1<tyer {
artist=string_copy(h,tpe1,tyer-tpe1-off2)
} else
artist=string_copy(h,tpe1,txxx-tpe1-off2)

//track num
if trck<tit2 {
tracknum=string_copy(h,trck,tit2-trck-off2)
} else
if trck<tpe1 {
tracknum=string_copy(h,trck,tpe1-trck-off2)
} else
if trck<talb {
tracknum=string_copy(h,trck,talb-trck-off2)
} else
if trck<tyer {
tracknum=string_copy(h,trck,tyer-trck-off2)
} else
tracknum=string_copy(h,trck,txxx-trck-off2)

buffer_destroy(b)
if artist='' and album='' and trackname='' and tracknum='' return filter(argument0)

return (tracknum+' - '+artist+' - '+trackname+' ('+album+')')
