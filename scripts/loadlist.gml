var file,fname,i,disknames,myfile,origfile,letter;
disknames="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fname=argument0
if !file_exists(fname) {show_message('The playlist "'+argument0+'" doesnt seem to exist.') exit}

file=file_text_open_read(fname)
while !file_text_eof(file)
{
    i=1
    myfile=file_text_read_string(file)
    if file_exists(myfile) {
       if is_supported(myfile)
          ds_list_add(global.list,myfile)
       else
          if room=mainroom show_message('Unsupported file format: "'+filename_ext(myfile)+'".#('+myfile+')')
          } else {if room=mainroom show_message("File doesn't exists: "+string(myfile))}

file_text_readln(file)

}
file_text_close(file)
if argument_count>1 {
if argument[1] {
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,0))
}
}
