///(dir) - returns list of folders
var _dir;
_dir=argument0;
var _list;_list=dslist()
var templist;
templist=file_find_list(_dir,'*.*',fa_directory,1,0)
var _i;_i=0 repeat(ds_list_size(templist)) {
    if directory_exists(dslist(templist,i)) dslist(_list,-1,dslist(templist,_i))
    _i+=1
}
ds_list_destroy(templist)
return _list;
