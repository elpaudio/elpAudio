var b;
b=buffer_create()
buffer_load_part(b,argument0,0,256)
buffer_set_pos(b,0)
var h,i;i=0
h=buffer_read_string(b)
modname=string_copy(h,0,20)
repeat 21 {if string_copy(modname,20-i,1)==' ' {modname=string_delete(modname,20-i,1)i+=1}}
if modname='' then return filter(argument0)
return modname
/*buffer_set_pos(b,20)
modsamplename=string_copy(buffer_read_string(b),1,22)
buffer_set_pos(b,42)
modsamplelen=hex_to_real(buffer_read_u16(b)*2)
buffer_set_pos(b,44)
modheadsize=hex_to_real(buffer_read_u32(b))
buffer_set_pos(b,45)
modlen=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,46)
modrespos=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,48)
modchannelnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,70)
modpatternnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,72)
modinstrumentnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,74)
modamigaflag=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,76)
moddefaulttempo=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,78)
moddefaultbpm=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,80)
modpatternorder=''

i=0
do {
mystr=hex_to_real(buffer_read_u8(b))
modpattern[i]=mystr
modpatternorder+="#"+hex_to_real(i)+" "+mystr
i+=1
} until (hex_to_real(buffer_read_u8(b))='00' and i>30) or i=256

modpatterns=0

ii=0
repeat(i-1) {
modpatterns+=sign(real(real_hex(modpattern[ii])))
ii+=1
}

hh=0
buffer_set_pos(b,336)
repeat(modpatterns) {
pattern[hh]=buffer_read_u32(b)
patternpacktype[hh]=buffer_read_u16(b)
patternrownum[hh]=buffer_read_u16(b)
patternpacksize[hh]=buffer_read_u16(b)
//show_message(string(pattern[hh])+"#"+string(patternpacktype[hh])+"#"+string(patternrownum[hh])+"#"+string(patternpacksize[hh]))
hh+=1
}*/
buffer_destroy(b)
