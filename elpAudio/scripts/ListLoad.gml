var file,fname,i,disknames,myfile,origfile,letter;
disknames="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fname=argument0

var migrated
{migrated=0;}

if !file_exists(fname) then {
    show_message(string_ext('The playlist {0}{1}{0} doesn{2}t seem to exist.','"',argument0,"'")) // shows "D:\not_exist.epl"
    exit
}

var adl;adl=ds_list_create()

if string_lower(filename_ext(fname))=='.epl' then { //.epl start

    /*    elpAudio should know what type of playlist it loads.
            Opens the file and reads first line.
            first line is a version
            If the first line is something else,
            then elpAudio automatically sets list version to 0. (old .elf file type)
      */

    file=file_text_open_read(fname)
    ds_list_clear(global.list)

    if string_copy(file_text_read_string(file),0,1)!='0'
    or string_copy(file_text_read_string(file),0,1)!='1' then
        global.list_type=0
    else
        global.list_type=file_text_read_real(file)

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

}  // .epl end
else if string_lower(filename_ext(fname))=='.elf' then {
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
           else if room=mainroom then
                  show_message('Unsupported file format: "'+filename_ext(myfile)+'".#('+myfile+')')

          } else {
          if FileIsOnDrives(myfile) then {
            if FileIsSupported(myfile) then
                ds_list_add(adl,myfile)
          } else {
            if room=mainroom then
                show_message("File doesn't exist: "+string(myfile))
            }
          }

    file_text_readln(file)
    }
file_text_close(file)
// .elf end
} else { // migrating start
    playlist_migrate(fname)
    migrated=1
    if __open_migrated_list==0 then
        show_message('Your file ('+fname+') was converted to .EPL playlist if everything went well. Find it at playlists\migrated folder and open them again here.')
    else
        ListLoad(global.__progdir+'playlists\migrate\'+filename_change_ext(filename_name(fname),'.epl'),1)
} // migrating end


copy_to_playlist(global.list,adl)
ds_list_destroy(adl)


if argument_count>1 {
if argument[1] and migrated=0 {
if global.play MusicStop()
global.current=0
MusicPlay(ds_list_find_value(global.list,0))
}
}
global._loaded_list=1
HandlePlaylistLoad() // FOR VISUALISERS AND PLUGINS !
