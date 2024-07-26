var file,fname,i,disknames,myfile,origfile,letter;
disknames="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fname=argument0
if !file_exists(fname) {show_message('The playlist "'+argument0+'" doesnt seem to exist.') exit}

var adl;adl=ds_list_create()

if string_upper(filename_ext(fname))=='.ELF' {
file=file_text_open_read(fname)
//if string_lettersdigits(file_text_read_string(file))='' {if global.play mus_stop() ds_list_clear(global.list) file_text_close(file) exit}
ds_list_clear(global.list)
while !file_text_eof(file)
{
    i=1
    myfile=file_text_read_string(file)
    var isweb;isweb=string_count('https://',string_lower(myfile)) or string_count('http://',string_lower(myfile))
    if file_exists(myfile) or isweb {
       if is_supported(myfile) or isweb
          ds_list_add(adl,myfile)
       else
          if room=mainroom show_message('Unsupported file format: "'+filename_ext(myfile)+'".#('+myfile+')')
          } else {if file_is_on_drive(myfile) {if is_supported(myfile) ds_list_add(adl,myfile)} else {if room=mainroom show_message("File doesn't exists: "+string(myfile))}}

file_text_readln(file)
}
file_text_close(file)
} else {
    playlist_migrate(fname)//,LINUX_FIX('playlists\'+filename_change_ext(filename_name(fname),'')))
    show_message('Your file ('+fname+') was converted to .ELF playlist. Find it at playlists\migrated folder and open them again here.')
    }
    copy_to_playlist(global.list,adl)
    ds_list_destroy(adl)


if argument_count>1 {
if argument[1] {
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,0))
}
}
