#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=global.__ico_admus
draw=0

add=0
click=0

showagain=1
image_blend=__butaddmuscol
prevdir=working_directory

globalvar __pl_window;__pl_window=-1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if click>1 {
file=get_open_filename('All supported files|*.mp3;*.ogg;*.wav;*.m4v;*.mp3;*.opus;*.mp2;*.3gp;*.mod;*.xm;*.etm;*.stm;*.s3m;*.it;*.mus;*.wasd;*.flac','')
if file='' nothing=1 else ds_list_add(global.list,file)}
else draw=1
click=0
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
if filename_ext(file_drag_name(i))=='.elf' then {
global.current=0
ListLoad(file_drag_name(i))
}
else continue;

i+=1

}

if global.play then MusicStop()
MusicPlay(ds_list_find_value(global.list,global.current))

if global.list_size>file_drag_count() then
global.current=global.list_size-file_drag_count()+1
else
global.current=0

file_drag_clear()
#define Mouse_4
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
if click=0 then
    alarm[0]=30
click+=1
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

if click=1 and alarm[0]<10 then
    alarm[0]=1

if draw=1 then {

select=show_menu_pos(window_get_x()+x,window_get_y()+y,'Add file|Add folder|Add URL|Download from URL|Show files|Clear playlist',-1)

if select=0 then {

    file=get_open_filename('All supported files|*.aiff;*.asf;*.asx;*.dls;*.flac;*.fsb;*.it;*.mid;*.rmi;*.mod;*.mp3;*.mp2;*.ogg;*.opus;*.s3m;*.vag;*.wav;*.wax;*.wma;*.xm;*.raw;*.iff;','')

    if file='' then
        nothing=1
    else {
        if FileIsSupported(file) then {
            ds_list_add(global.list,file)
            prevdir=filename_dir(file)
        } else
            show_message("Unsupported file: "+file)
    }
} //select=0

if select=1 then {

    folder=get_directory_alt('Add folder to your playlist','')
    if folder='' then
        nothing=1
    else
        GetMusicFromFolder(folder+'\')

} //select=1

if select=2 {

    myurl=get_string('Type in the URL to add music from','https://elpoepgames.site/elpAudio/music/welcome.mp3')
    var isweb;isweb=string_count('https://',string_lower(myurl)) or string_count('http://',string_lower(myurl))
    if FileIsSupported(myurl) or isweb then
        ds_list_add(global.list,myurl)

} //select=2

if select=3 {

    myurl=get_string('Type in the URL to add music from','https://elpoepgames.site/elpAudio/music/welcome.mp3')
    if myurl='' then
        nothing=1
    else {
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

} //select=3

if select=4 then
    execute_program('explorer.exe','/root,"'+global.dirr+'"',0)

if select=5 then
    ds_list_clear(global.list)

draw=0

} //draw=1
