var file,fname,i,disknames,myfile,origfile,letter;
disknames="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fname=argument0
var migrated
{migrated=0;}
if !file_exists(fname) then {
show_message('The playlist "'+argument0+'" doesnt seem to exist.')
exit
}

var adl;adl=ds_list_create()

if string_lower(filename_ext(fname))=='.elf' {
file=file_text_open_read(fname)
ds_list_clear(global.list)
while !file_text_eof(file)
{
    i=1
    myfile=file_text_read_string(file)
    var isweb;isweb=string_count('https://',string_lower(myfile)) or string_count('http://',string_lower(myfile))
    if file_exists(myfile) or isweb {
       if FileIsSupported(myfile) or isweb then
          ds_list_add(adl,myfile)
       else
          if room=mainroom then
          show_message('Unsupported file format: "'+filename_ext(myfile)+'".#('+myfile+')')

          } else {
          if FileIsOnDrives(myfile) then {
          if FileIsSupported(myfile) then
          ds_list_add(adl,myfile)
          } else {
          if room=mainroom then
          show_message("File doesn't exists: "+string(myfile))
                }
          }

file_text_readln(file)
}
file_text_close(file)
} else {
    playlist_migrate(fname)
    migrated=1
    show_message('Your file ('+fname+') was converted to .ELF playlist if everything wen well. Find it at playlists\migrated folder and open them again here.')
    }
    copy_to_playlist(global.list,adl)
    ds_list_destroy(adl)


if argument_count>1 {
if argument[1] and migrated=0 {
if global.play MusicStop()
global.current=0
MusicPlay(ds_list_find_value(global.list,0))
}
}
