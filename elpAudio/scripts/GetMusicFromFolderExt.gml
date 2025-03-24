///(dir) - returns list
var _dir;
_dir=argument0;
var _list;_list=dslist()
var templist;
templist=file_find_list(_dir,'*.*',0,1,1)
var _i;_i=0 repeat(ds_list_size(templist)) {
    if FileIsSupported(dslist(templist,_i)) dslist(_list,-1,dslist(templist,_i))
    _i+=1
}
ds_list_destroy(templist)
return _list;
