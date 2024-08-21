if !variable_global_exists('list') global.list=ds_list_create()
else ds_list_clear(global.list)

if !registry_exists_ext('elpAudio','work_dir')
registry_write_string_ext('elpAudio','work_dir',program_directory)

room_caption='elpAudio '+Get_elpAudioVersion()
global.play=0
global.paused=0
global.stopped=0
global.trackname=''
global.playing=-1
global.themepath='themes\default\theme.ini'
global.current=0
global.thesong=''
global.volume=100
global.randomized=0
global._loaded_list=0
global.list_type=0 // 0 - regular, 1 - "radio"

global.__progdir=registry_read_string_ext('elpAudio','work_dir')+'\'
if debug_mode global.__progdir=working_directory+'\'
if os_type==os_linux global.__progdir=program_directory+'\'
set_working_directory(global.__progdir)

globalvar __enablefloat,__stopsongafter,__speed,__visualiser,__visual_freq,__stick_to_edges
__enablevisdist,__changecaption,__captionchangespd,
__customcaption_idle,__customcaption_play,__customcaption_ch1,__customcaption_ch2,
__enable_fswitch,__elp_enable_old_themes,
__preload_type,__open_migrated_list
;

__elp_enable_old_themes=0;  // enable old themes (BAD!!!!!!!!!!!!!!)
__enablevisdist=0;          // enable visualisation distortion (maybe unused)
__enablefloat=0;            // enable floating text
__stopsongafter=0;          // stop song after playing
__visualiser=0;             // current visualiser
__speed=15;                 // floating text speed
__visual_freq=64;           // visual frequency (bars)
__stick_to_edges=1;         // stick window to display edges (only one display)
__changecaption=1;          // changing caption
__captionchangespd=3;       // changing caption speed in seconds
__enable_fswitch=1;         // enable fullscreen switching
__preload_type=1;           //disk stream
__open_migrated_list=1;     // open migrated playlist after converting

__customcaption_idle='elpAudio '+Get_elpAudioVersion();
__customcaption_play='';
__customcaption_ch1='';
__customcaption_ch2='';


global.songartist=''
global.songtitle=''
global.songnumber=''
global.songalbum=''
global.songimg=''
global.songgenre=''
global.songyear=''

if file_exists(global.__progdir+'settings.ini') {
ini_open(global.__progdir+'settings.ini')
global.themepath=global.__progdir+string_copy(ini_read_string('','themePath','themes\default\theme.ini'),string_pos('themes\',ini_read_string('','themePath','themes\default\theme.ini')),1024)
__speed=ini_read_real('','textSpeed',15)
global.volume=ini_read_real('','volume',100)
global.current=ini_read_real('','lastSong',0)
__visualiser=ini_read_real('','lastVisualiser',0)
__visual_freq=ini_read_real('','visualiserBars',64)
__customcaption_idle=ini_read_string('Caption','customCaptionIdle','elpAudio %v')
__customcaption_play=ini_read_string('Caption','customCaptionPlay','(%t1:%ta1) elpAudio %v [%pn/%ps]')
__customcaption_ch1=ini_read_string('Caption','customCaptionChange1','(%t1 / %ta1) elpAudio %v [%pn/%ps]')
__customcaption_ch2=ini_read_string('Caption','customCaptionChange2','(%sn) elpAudio %v [%pn/%ps]')
__changecaption=ini_read_real('Caption','changeCaption',1)
__captionchangespd=ini_read_real('Caption','captionChangeSpeed',3)*60
__enable_fswitch=ini_read_real('','enableSwitchFScreen',1)
__stick_to_edges=ini_read_real('','windowSticksToEdges',1)
__stopsongafter=ini_read_real('','stopSongAfterPlaying',0)
__elp_enable_old_themes=ini_read_real('','EnableOldThemes',0)
__open_migrated_list=ini_read_real('','OpenMigratedListAfterConverting',1)
__preload_type=ini_read_real('','MusicPreloadType',1)
global.randomized=ini_read_real('','ShuffleSongs',0)
room_speed=max(ini_read_real('','framerate',60),1)
ini_close()
} else {
ini_open(global.__progdir+'settings.ini')
ini_write_string('','themePath',global.__progdir+'themes\default\theme.ini')
ini_write_real('','textSpeed',15)
ini_write_real('','lastSong',0)
ini_write_real('','lastVisualiser',0)
ini_write_real('','visualiserBars',64)
ini_write_real('','enableSwitchFScreen',1)
ini_write_string('Caption','customCaptionIdle','elpAudio %v')
ini_write_string('Caption','customCaptionPlay','(%t1 / %ta1) elpAudio %v [%pn/%ps]')
ini_write_real('Caption','changeCaption',1)
ini_write_real('Caption','captionChangeSpeed',3)
ini_write_string('Caption','customCaptionChange1','(%t1 / %ta1) elpAudio %v [%pn/%ps]')
ini_write_string('Caption','customCaptionChange2','(%sn) elpAudio %v [%pn/%ps]')
ini_write_real('','framerate',60)
ini_write_real('','ShuffleSongs',0)
ini_write_real('','EnableOldThemes',0)
ini_write_real('','OpenMigratedListAfterConverting',1)
room_speed=60
ini_close()
}
if file_exists(global.__progdir+'playlists\temp.elf') ListLoad(global.__progdir+'playlists\temp.elf',0)
else GetMusicFromFolder(global.__progdir+'music_examples\')

__customcaption_idle='elpAudio '+Get_elpAudioVersion()
