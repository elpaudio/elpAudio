///(dir)
var mydir,i,findfile,txt;
global.dirr=string_replace_all(argument0,"/","\")
if !string_ends_with(global.dirr,'\') global.dirr=argument0+'\'
findfile=0
if directory_exists(global.dirr) {
    i=1
    exts='*.*'

    // ALL FILES
    mus[0]=file_find_first(global.dirr+exts,findfile);
    if mus[0]!='' {
        if FileIsSupported(mus[0]) {ii=0 rep=0 repeat(ds_list_size(global.list)) {if ds_list_find_value(global.list,ii)==global.dirr+mus[0] rep=1 ii+=1} if !rep ds_list_add(global.list,global.dirr+mus[0])};
        repeat(2048) {
            mus[i]=file_find_next();
                if mus[i]!='' {
                    if FileIsSupported(mus[i]) {ii=0 rep=0 repeat(ds_list_size(global.list)) {if ds_list_find_value(global.list,ii)==global.dirr+mus[i] rep=1 ii+=1} if !rep ds_list_add(global.list,global.dirr+mus[i])};
                    i+=1
                } else break;
        }
    }
    file_find_close()
}
