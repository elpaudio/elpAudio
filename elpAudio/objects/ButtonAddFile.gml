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

menustr='Add file|Add folder|Add URL|Download from URL|Show files|Clear playlist'

globalvar __pl_window;__pl_window=-1
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
if !window_get_active() exit
image_index=1
#define Mouse_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=0

file=get_open_filename('All supported files|'+__fformats,'')

if file!='' {
    if FileIsSupported(file) then {
        ds_list_add(global.list,file)
        prevdir=filename_dir(file)
    } else
        show_message("Unsupported file: "+file)
}
#define Mouse_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
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
switch(select) {
    case 0: {
        file=get_open_filename('All supported files|'+__fformats,'')

        if file!='' {
            if FileIsSupported(file) then {
                ds_list_add(global.list,file)
                prevdir=filename_dir(file)
            } else
                show_message("Unsupported file: "+file)
        } break;
    }
    case 1: {
        folder=get_directory_alt('Add folder to your playlist','')
        if folder='' then
            nothing=1
        else {
            if !__recursive GetMusicFromFolder(folder+'\')
            else {
                listt=file_find_list(folder,'*.*',fa_hidden,1,1)
                i=0
                repeat ds_list_size(listt) {val=ds_list_find_value(listt,i) if FileIsSupported(val) ds_list_add(global.list,val) i+=1}
                ds_list_destroy(listt)
            }
        } break;
    }
    case 2: {
        myurl=get_string('Type in the URL to add music from','https://elpoepgames.site/elpAudio/music/welcome.mp3')
        isweb=string_count('https://',string_lower(myurl)) or string_count('http://',string_lower(myurl))
        if FileIsSupported(myurl) or isweb then
            ds_list_add(global.list,myurl)
        break;
        }
    case 3: {
        myurl=get_string('Type in the URL to download music from','https://elpoepgames.site/elpAudio/music/welcome.mp3')
        if myurl!=''{
            _connect=httprequest_create()
            httprequest_connect(_connect,httprequest_urlencode(myurl,0),0)
            mfile=buffer_create()
            while true {
                httprequest_update(_connect);
                st = httprequest_get_state(_connect);
                if st=4 or st=5 then
                    break;
            sleep_ext(10);
            }
        if st=5 then {
            show_message("Internet-download failed.#Your url: "+myurl);
        } else {
            //show_message("Downloading succeeded.");
            httprequest_get_message_body_buffer(_connect,mfile)
            var f;f=working_directory+'\music_examples\http_'+string(irandom_range(10000,100000))+filename_ext(myurl)
            buffer_save(mfile,f)
            ds_list_add(global.list,f)
        }
        buffer_destroy(mfile)
        httprequest_destroy(_connect)
        } //url!=''
    break;
    }
    case 4: execute_program('explorer.exe','/root,"'+global.dirr+'"',0); break;
    case 5: {
    MusicStop()
    global.current=0
    global.curpreloaded=-1
    global.preloaded=-1
    ds_list_clear(global.list)
    break;
    }
    default: break;
}
draw=0

} //draw=1
