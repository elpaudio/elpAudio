dllname='windows.dll'
if file_exists(dllname) {
if !variable_global_exists('eapi_trayprepballoon') then
    global.eapi_trayprepballoon=external_define (dllname,'hobbl_com_systray_prepareballoon',dll_stdcall,ty_real,4,ty_string,ty_string,ty_real,ty_real);

if !variable_global_exists('eapi_traysetballoon') then
    global.eapi_traysetballoon = external_define (dllname,'hobbl_com_systray_setballoon',dll_stdcall,ty_real,2,ty_real,ty_real);

if !variable_global_exists('eapi_resaddicon') then
    global.eapi_resaddicon = external_define (dllname,'hobbl_com_resource_loadicon',dll_stdcall,ty_real,1,ty_string);

if !variable_global_exists('eapi_trayseticon') then
    global.eapi_trayseticon = external_define (dllname,'hobbl_com_systray_seticon',dll_stdcall,ty_real,3,ty_real,ty_real,ty_real);

if !variable_global_exists('eapi_trayadd') then
    global.eapi_trayadd=external_define (dllname,'hobbl_com_systray_add',dll_stdcall,ty_real,3,ty_real,ty_string,ty_real);

if !variable_global_exists('eapi_trayremove') then
    global.eapi_trayremove=external_define (dllname,'hobbl_com_systray_remove',dll_stdcall,ty_real,2,ty_real,ty_real);

external_call(global.eapi_trayadd,window_handle(),'elpAudio',0)
external_call(global.eapi_trayprepballoon,'elpAudio',global.trackname,0,1);
external_call(global.eapi_traysetballoon,window_handle(),0)
var mi;mi=external_call(global.eapi_resaddicon,'data\ico.ico')
external_call(global.eapi_trayseticon,mi)
return 1
}
