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

if string_lower(filename_ext(fname))=='.epl' then { //.epl start

    /*    elpAudio should know what type of playlist it loads.
            Opens the file and reads first line.
            0 - regular playlist, 1 - "radio playlist"
            If the first line is something else,
            then elpAudio automatically sets list type to 0. (old .elf file type)
      */

    file=file_text_open_read(fname)
    if file_text_read_string(file)!='0'
    or file_text_read_string(file)!='1' then
        global.list_type=0
    else
        global.list_type=real(string_replace_all(file_text_read_string(file),' ',''))

    file_text_readln(file);

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

}  // .elf end
else if string_lower(filename_ext(fname))=='.elf' then {
    file=file_text_open_read(fname)

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

} else { // migrating start
    playlist_migrate(fname)
    migrated=1
    if __open_migrated_list==0 then
        show_message('Your file ('+fname+') was converted to .EPL playlist if everything went well. Find it at playlists\migrated folder and open them again here.')
    else
        ListLoad(global.__progdir+'playlists\migrate\'+filename_change_ext(filename_name(fname),'.epl'),1)
} // migrating end

ds_list_clear(global.list)
copy_to_playlist(global.list,adl)
ds_list_destroy(adl)


if argument_count>1 {
if argument[1] and migrated=0 {
if global.play MusicStop()
global.current=0
MusicPlay(ds_list_find_value(global.list,0))
}
global._loaded_list=1
HandlePlaylistLoad() // FOR VISUALISERS AND PLUGINS !
}
