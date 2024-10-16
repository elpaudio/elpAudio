///(fname)
var file,fname,i;
fname=argument0
if file_exists(fname) then
file_delete(fname)

if !string_ends_with(string_lower(fname),'.epl') then
fname+='.epl'

file=file_text_open_write(fname)
i=0

//list type. 0-normal, 1-radio
file_text_write_string(file,string(global.list_type))
file_text_writeln(file)

repeat(ds_list_size(global.list))
{
var isweb
{isweb=string_count('https://',string_lower(ds_list_find_value(global.list,i))) or string_count('http://',string_lower(ds_list_find_value(global.list,i)))}

if FileIsSupported(string(ds_list_find_value(global.list,i))) or isweb then
{
file_text_write_string(file,string(ds_list_find_value(global.list,i)))
file_text_writeln(file)
}
i+=1
}
file_text_close(file)
