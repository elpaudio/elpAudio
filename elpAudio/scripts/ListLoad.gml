var file,fname,myfile,va,isweb,migrated,str_unsupported,str_notexist;
fname=argument0
migrated=0
str_unsupported='Unsupported file format: "{0}".#({1})'
str_notexist='File does not exists: "{0}".'

if !file_exists(fname) {
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

    if string_copy(file_text_read_string(file),0,1)!='0'
    or string_copy(file_text_read_string(file),0,1)!='1'
        global.list_type=0
    else
        global.list_type=file_text_read_real(file)

    file_text_readln(file);

    while !file_text_eof(file)
    {
        myfile=FileIsOnDrives(file_text_read_string(file))
        isweb=string_count('https://',string_lower(myfile)) or string_count('http://',string_lower(myfile))

        if file_exists(myfile) or isweb {
           if FileIsSupported(myfile) or isweb
              ds_list_add(adl,myfile)
           else
              if myfile!=''
                  show_message(string_ext(str_unsupported,filename_ext(myfile),myfile))
          } else {
              if myfile!=''
                  show_message(string_ext(str_notexist,string(myfile)))
            }

    file_text_readln(file)
    }
file_text_close(file)

}  // .epl end
else if string_lower(filename_ext(fname))=='.elf' then {
    file=file_text_open_read(fname)

    while !file_text_eof(file)
    {
        myfile=FileIsOnDrives(file_text_read_string(file))
        isweb=string_count('https://',string_lower(myfile)) or string_count('http://',string_lower(myfile))

        if file_exists(myfile) or isweb {
           if FileIsSupported(myfile) or isweb
              ds_list_add(adl,myfile)
           else if myfile!=''
                  show_message(string_ext(str_unsupported,filename_ext(myfile),myfile))
        } else {
            if myfile!=''
                show_message(string_ext(str_notexist,string(myfile)))
        }

    file_text_readln(file)
    }
file_text_close(file)
// .elf end
} else { // migrating start
    playlist_migrate(fname)
    migrated=1
    if __open_migrated_list==0
        show_message(string_ext('Your file ({0}) was converted to .EPL playlist if everything went well. Find it at playlists\migrated folder and open them again here.',fname))
    else
        ListLoad(global.__progdir+'playlists\migrate\'+filename_change_ext(filename_name(fname),'.epl'),1)
} // migrating end

if !ds_list_empty(adl) {
    ds_list_clear(global.list)
    copy_to_playlist(global.list,adl)
}
ds_list_destroy(adl)

if argument_count>1 {
    if argument[1] and migrated=0 {
        if global.play MusicStop()
        global.current=0
        global.curpreloaded=-1
        if global.preloaded!=-1 FMODSoundFree(global.preloaded)
        MusicPlay(ds_list_find_value(global.list,0))
    }
}
global._loaded_list=1
HandlePlaylistLoad() // FOR VISUALISERS AND PLUGINS !
