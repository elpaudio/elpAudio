#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
SettingsLoad(1)

if !registry_exists_ext('elpAudio','FIRST_TIME_DISABLE') {
    registry_write_string_ext('elpAudio','FIRST_TIME_DISABLE','hello regedit user!')
    show_message('Welcome to elpAudio! 
    elpAudio is a simple audio-player using FMODex Sound System. 
    Check out "elpoeprod.github.io/elpAudio/" 
    or github page "elpaudio/elpAudio" for more info.
    
    FMODex is a product of Firelight Technologies.
    ')
}

LoadTheme(global.themepath)

background_color=Color('bg')

WindowResize(global.plrwidth,global.plrheight)

icon=icon_add(global.__progdir+'data\ico.ico')
window_set_icon(icon)
window_set_taskbar_icon(icon)
file_drag_enable(1)
instance_destroy()
