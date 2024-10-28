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
image_blend=__butaddmuscol
prevdir=working_directory

menustr='Add file|Add folder|Add URL|Show files|Clear playlist'

AddFileAction(0,"file=GetOpenFilename('Add files to your playlist.',working_directory,'somefile.mp3','All supported files|'+__fformats)if file!='' {if FileIsSupported(file) then {ds_list_add(global.list,file)prevdir=filename_dir(file)} else show_message('Unsupported file: '+file)}")
AddFileAction(1,"folder=get_directory_alt('Add folder to your playlist','')if folder='' then nothing=1 else {if !__recursive GetMusicFromFolder(folder+'\') else {listt=file_find_list(folder,'*.*',fa_hidden,1,1)i=0 repeat ds_list_size(listt) {val=ds_list_find_value(listt,i) if FileIsSupported(val) ds_list_add(global.list,val) i+=1} ds_list_destroy(listt)}}")
AddFileAction(2,"myurl=get_string('Type in the URL to stream music from (radio)','https://elpoepgames.site/elpAudio/music/welcome.mp3') isweb=string_count('https://',string_lower(myurl)) or string_count('http://',string_lower(myurl)) if isweb then ds_list_add(global.list,myurl)")
AddFileAction(3,string_ext("execute_program('explorer.exe','/root,{0}'+filename_dir(GetListEntryRaw(global.current))+'{0}',0);",'"'))
AddFileAction(4,"MusicStop() MetadataClear() global.current=0 global.curpreloaded=-1 global.preloaded=-1 ds_list_clear(global.list) global._loaded_list=1 HandlePlaylistLoad()")
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
file=GetOpenFilename('Add files to your playlist.',working_directory,'somefile.mp3','All supported files|'+__fformats)
if file!='' {
    if FileIsSupported(file) then
        ds_list_add(global.list,file)
    else
        show_message("Unsupported file: "+file)
}
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

if FileIsSupported(file_drag_name(i)) then
ds_list_add(global.list,file_drag_name(i))
else
if filename_ext(file_drag_name(i))=='.elf' or filename_ext(file_drag_name(i))=='.epl' then {
global.current=0
ListLoad(file_drag_name(i))
}
else continue;

i+=1

}
//using ds_list_size becuase global.list_size holds old size on this :p
if ds_list_size(global.list)>file_drag_count() then
global.current=ds_list_size(global.list)-file_drag_count()
else
global.current=0

if global.play then MusicStop()
MusicPlay(ds_list_find_value(global.list,global.current))

file_drag_clear()
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if draw=1 then {

select=show_menu_pos(window_get_x()+x+sprite_width,window_get_y()+y+sprite_height,menustr,-1)
event_user(0)
draw=0

} //draw=1
