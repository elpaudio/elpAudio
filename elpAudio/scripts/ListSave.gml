///(fname)
var file,fname,i,isweb;
fname=argument0
if file_exists(fname) then
    file_delete(fname)

if !string_ends_with(string_lower(fname),'.epl') then
    fname+='.epl'

file=file_text_open_write(fname)
i=0

file_text_write_string(file,'0')//string(global.list_type))
file_text_writeln(file)

repeat(global.list_size) {
    isweb=(string_count('https://',string_lower(GetListEntryRaw(i))) or string_count('http://',string_lower(GetListEntryRaw(i))));

    if FileIsSupported(string(dslist(global.list,i))) or isweb {
        file_text_write_string(file,GetListEntryRaw(i))
        file_text_writeln(file)
    }
    i+=1
}
file_text_close(file)
