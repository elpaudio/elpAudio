var b;
b=buffer_create()
buffer_load_part(b,argument0,0,256)
buffer_set_pos(b,0)
var h,i;
i=0
h=buffer_read_string(b)
xmname=string_copy(h,18,20)
//show_message(string_replace_all(xmname,' ','|'))
repeat 21 {if string_copy(xmname,20-i,1)==' ' {xmname=string_delete(xmname,20-i,1)i+=1}}
if xmname='' then return FilterString(argument0)
return xmname
//show_message(string_replace_all(xmname,' ','|'))
/*buffer_set_pos(b,38)
xmfrom=string_copy(buffer_read_string(b),1,20)
buffer_set_pos(b,58)
xmver=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,60)
xmheadsize=hex_to_real(buffer_read_u32(b))
buffer_set_pos(b,64)
xmlen=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,66)
xmrespos=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,68)
xmchannelnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,70)
xmpatternnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,72)
xminstrumentnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,74)
xmamigaflag=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,76)
xmdefaulttempo=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,78)
xmdefaultbpm=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,80)
xmpatternorder=''

i=0
repeat(xmpatternnum) {
mystr=hex_to_real(buffer_read_u8(b))
xmpattern[i]=mystr
xmpatternorder+="#"+hex_to_real(i)+" "+mystr
i+=1
}
xmpatterns=0

ii=0
repeat(i-1) {
xmpatterns+=sign(real(real_hex(xmpattern[ii])))
ii+=1
}

hh=0
buffer_set_pos(b,336)
repeat(xmpatterns) {
pattern[hh]=buffer_read_u32(b)
patternpacktype[hh]=buffer_read_u16(b)
patternrownum[hh]=buffer_read_u16(b)
patternpacksize[hh]=buffer_read_u16(b)
//show_message(string(pattern[hh])+"#"+string(patternpacktype[hh])+"#"+string(patternrownum[hh])+"#"+string(patternpacksize[hh]))
hh+=1
}*/
buffer_destroy(b)
