///(dir)
var mydir,i,findfile,txt;
global.dirr=string_replace_all(argument0,"/","\")
if !string_ends_with(global.dirr,'\') global.dirr=argument0+'\'
findfile=0
if directory_exists(global.dirr) {
    i=1
    exts='*.*'

    // ALL FILES
    for(mus=file_find_first(global.dirr+exts,findfile);mus!='';mus=file_find_next();) {
        if FileIsSupported(mus) {
            ii=0
            rep=0
            repeat(ds_list_size(global.list)) {
                if dslist(global.list,ii)==global.dirr+mus
                    rep=1
                ii+=1
            }
            if !rep
                dslist(global.list,-1,global.dirr+mus)
        };
            i+=1
    }
    file_find_close()
}
