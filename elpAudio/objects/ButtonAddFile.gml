#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=global.__ico_admus
draw=0
file=''
showagain=1
prevdir=working_directory

menu=N_Menu_CreatePopupMenu()
    N_Menu_ItemSetBitmap(menu,N_Menu_AddItem(menu,'Add file',''),N_Menu_LoadBitmap('icons\addmus.bmp'))
    N_Menu_ItemSetBitmap(menu,N_Menu_AddItem(menu,'Add folder',''),N_Menu_LoadBitmap('icons\openfolder.bmp'))
    N_Menu_AddItem(menu,'Add URL','')
    N_Menu_AddItem(menu,'Show in explorer','')
    N_Menu_AddSeparator(menu)
    N_Menu_AddItem(menu,'Load playlist','')
    N_Menu_AddItem(menu,'Save playlist','')
    N_Menu_AddSeparator(menu)
    N_Menu_AddItem(menu,'Remove file','')
    N_Menu_AddItem(menu,'Remove folder','')
    N_Menu_AddItem(menu,'Clear playlist','')


AddFileAction(2000,"file=GetOpenFilename('Add a file to your playlist.',working_directory,'somefile.mp3','All supported files|'+__fformats)if file!='' {if FileIsSupported(file) {if ds_list_empty(global.list) {global.pstate=EA_STOPPED} ds_list_add(global.list,file) prevdir=filename_dir(file) global.preloaded=-1 global.curpreloaded=-1 } else show_message('Unsupported file: '+file)} if ds_list_size(global.list)==1 MusicPlay(GetListEntryRaw(global.current))")
AddFileAction(2001,"folder=get_directory_alt('Add folder to your playlist','')if folder='' nothing=1 else {if !__recursive GetMusicFromFolder(folder+'\') else {listt=file_find_list(folder,'*.*',fa_hidden,1,1) i=0 repeat(ds_list_size(listt)) {val=ds_list_find_value(listt,i) i+=1 if FileIsSupported(val) ds_list_add(global.list,val) } ds_list_destroy(listt)}if global.curpreloaded!=-1 global.curpreloaded=-1 if global.preloaded {FMODSoundFree(global.preloaded) global.preloaded=-1}}")
AddFileAction(2002,"myurl=get_string('Type in the URL to stream music from (radio)','https://music.com/music.mp3') isweb=string_count('https://',string_lower(myurl)) or string_count('http://',string_lower(myurl)) if isweb then ds_list_add(global.list,myurl)")
AddFileAction(2003,string_ext("execute_program('explorer.exe',string_ext('/root,{0}{1}{0}','{2}',filename_dir(GetListEntryRaw(global.current))),0);",'{0}','{1}','"'))

AddFileAction(2006,"myfile=get_open_filename('All supported files|'+__flists,'list.epl')if myfile!='' {ListLoad(myfile,1) global.pstate=EA_STOPPED}")
AddFileAction(2007,"myfile=get_save_filename('elpAudio Play List|*.epl','list-1.epl')if myfile='' nothing=1 else ListSave(myfile)")

AddFileAction(2010,"ds_list_delete(global.list,global.current) if ds_list_size(global.list)>1 global.current=global.current mod ds_list_size(global.list)-1 else global.current=0; if variable_global_exists('musicsound') {FMODInstanceStop(global.trackhandle) FMODSoundFree(global.musicsound) global.trackhandle=-1 global.musicsound=-1} MetadataClear() if global.curpreloaded!=-1 global.curpreloaded=-1 if global.preloaded {FMODSoundFree(global.preloaded) global.preloaded=-1} if !ds_list_empty(global.list) eaPlay(global.current);")
AddFileAction(2011,"MusicImmediatelyStop() i=0 bb=dslist(global.list,global.current) ll=dslist() repeat(ds_list_size(global.list)) {if string_lower(filename_path(dslist(global.list,i)))==string_lower(filename_path(bb)) dslist(ll,-1,ds_list_find_value(global.list,i)) i+=1} i=0 repeat(ds_list_size(ll)) {ds_list_delete(global.list,ds_list_find_index(global.list,dslist(ll,i)))i+=1} ds_list_clear(ll) ds_list_destroy(ll) global.current=0 if ds_list_empty(global.list) HandlePlaylistLoad()")
AddFileAction(2012,"MusicImmediatelyStop() global.current=0 ds_list_clear(global.list) MetadataClear() HandlePlaylistLoad()")
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
select=2000 event_user(0)
image_index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///FILE DRAGGING
if file_drag_count()<=0 exit
i=0
repeat(file_drag_count()) {

    if FileIsSupported(file_drag_name(i))
        dslist(global.list,-1,file_drag_name(i))
    else
        if string_pos(string_lower(filename_ext(file_drag_name(i))),__flists) {
            global.current=0
            ListLoad(file_drag_name(i))
        }
    else continue;

    i+=1

}
//using ds_list_size becuase global.list_size holds old size on this :p
if ds_list_size(global.list)>file_drag_count()
    global.current=ds_list_size(global.list)-file_drag_count()
else
    global.current=0

if global.pstate!=EA_NONE MusicStop()
MusicPlay(dslist(global.list,global.current))

file_drag_clear()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Drawing menu
if draw=1 then {

N_Menu_ShowPopupMenu(window_handle(),menu,window_get_x()+x+sprite_width,window_get_y()+y+sprite_height,0)
io_clear()
select=N_Menu_CheckMenus()
event_user(0)
draw=0

} //draw=1
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=1
alarm[2]=1
#define Mouse_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=1
#define Mouse_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
draw=1
image_index=0
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
