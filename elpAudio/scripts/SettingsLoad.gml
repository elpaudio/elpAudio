if !variable_global_exists('list') then
    global.list=ds_list_create()
else
    ds_list_clear(global.list)

MetadataCreate()
MetadataClear()

if !registry_exists_ext('elpAudio','work_dir') then
    registry_write_string_ext('elpAudio','work_dir',program_directory)

globalvar __fformats; //file formats
    __fformats='*.aiff;*.asf;*.at3;*.at9;*.cda;*.asx;*.dls;*.flac;*.fsb;*.it;*.mid;*.rmi;*.mod;*.mp2;*.mp3;*.ogg;*.opus;*.s3m;*.vag;*.wav;*.wma;*.xm;*.xma';

globalvar __flists; // supported playlist formats
    __flists='*.epl;*.elf;*.m3u;*.m3u8;*.ram;*.axf;*.wax;*.wvx;*.wpl;*.w3c;*.b4s;*.p2p;*.kpl;*.itl;*.rdf;*.pls;'

globalvar __monitors  , //monitor count
          __monitorpos; //monitor position

__monitors=1;   //one monitor
__monitorpos=0 //-1 - two monitors, second monitor on left
                //0 - one monitor,
                //1 - two monitors, second monitor on right
                //you can change it with Shift+Left/Right arrow

globalvar ea_version;
if !registry_exists_ext('elpAudio','version')
    registry_write_string_ext('elpAudio','version',Get_elpAudioVersion())

if registry_read_string_ext('elpAudio','version')!=Get_elpAudioVersion()
    registry_write_string_ext('elpAudio','version',Get_elpAudioVersion())
ea_version=registry_read_string_ext('elpAudio','version')
room_caption='elpAudio '+ea_version
room_speed=60
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
global.list_type=0
global.preloaded=0
global.curpreloaded=-1
global.preloadedsong=-1
global.is_stereo=0
global.list_size=0
global.pos=0
global._focused=0
global.__gonnareset=0

global.dirr=''
global.FMODbuf = string_repeat(chr(0), 256)

global.realwidth=display_get_width()
global.realheight=display_get_height()

if registry_exists_ext('elpAudio','work_dir') then
    global.__progdir=registry_read_string_ext('elpAudio','work_dir')+'\';
else {
    show_message("Sorry, but elpAudio can't initialize, because it can't read registry value HKEY_CURRENT_USER/elpAudio/work_dir.")
    game_end()
    exit
    }

set_working_directory(global.__progdir)
if !directory_exists(global.__progdir+'playlists') directory_create(global.__progdir+'playlists')

globalvar __enablefloat,__stopsongafter,__speed,__visualiser,__visual_freq,__stick_to_edges
__enablevisdist,__changecaption,__captionchangespd,
__customcaption_idle,__customcaption_play,__customcaption_ch1,__customcaption_ch2,
__elp_enable_old_themes,
__preload_type,__open_migrated_list,
__DisVisWhenNotAct,__PreloadNextSong,
__FrameSkip,__millisecs,
__recursive,
delta_time,
__buffer_size,
__skipdrivecheck,
__allow_balloons
;

__elp_enable_old_themes=0;  // enable old themes (BAD!!!!!!!!!!!!!!)
__enablefloat=0;            // enable floating text
__stopsongafter=0;          // stop song after playing
__visualiser=0;             // current visualiser
__speed=15;                 // floating text speed
__visual_freq=64;           // visual frequency (bars)
__stick_to_edges=1;         // stick window to display edges (only one display)
__changecaption=1;          // changing caption
__captionchangespd=3;       // changing caption speed in seconds
__preload_type=1;           // stream song or not
__open_migrated_list=1;     // open migrated playlist after converting
__DisVisWhenNotAct=0;       // disable visualiser when window is not active nor focused
__PreloadNextSong=1;        // preload next song when current song is about to end
__FrameSkip=0;              // skip frames enabler
__millisecs=1;              // frames for skip (if __FrameSkip==1)
__recursive=0;              // recursive file adder in Add File button
delta_time=room_speed;      // delta speed
__buffer_size=256;          // audio buffer size
__skipdrivecheck=1;         // Skip "file is on drives" checking (checks every connected drives (like C:, D:) for that file, useful if music file has changed the drive but folder tree was kept the same, but it's slow!)
__allow_balloons=1;         // show notifications when song was changed

__customcaption_idle='elpAudio '+ea_version;
__customcaption_play='';
__customcaption_ch1='';
__customcaption_ch2='';

var mysec;mysec='General'
if file_exists(global.__progdir+'settings.ini') {
    ini_open(global.__progdir+'settings.ini')
        global.themepath=       global.__progdir+string_copy(ini_read_string(mysec,'themePath','themes\default\theme.ini'),string_pos('themes\',ini_read_string(mysec,'themePath','themes\default\theme.ini')),1024)
        __speed=                ini_read_real(mysec,'textSpeed',15)
        global.volume=          ini_read_real(mysec,'volume',100)
        global.current=         ini_read_real(mysec,'lastSong',0)
        __visualiser=           ini_read_real(mysec,'lastVisualiser',0)
        __visual_freq=          ini_read_real(mysec,'visualiserBars',64)
        __enable_fswitch=       ini_read_real(mysec,'enableSwitchFScreen',1)
        __stick_to_edges=       ini_read_real(mysec,'windowSticksToEdges',1)
        __stopsongafter=        ini_read_real(mysec,'stopSongAfterPlaying',0)
        __elp_enable_old_themes=ini_read_real(mysec,'EnableOldThemes',0)
        __open_migrated_list=   ini_read_real(mysec,'OpenMigratedListAfterConverting',1)
        __preload_type=         ini_read_real(mysec,'MusicPreloadType',1)
        __DisVisWhenNotAct=     ini_read_real(mysec,'DisableVisualiserWhenNotFocused',0)
        __PreloadNextSong=      ini_read_real(mysec,'PreloadNextSong',1)
        global.randomized=      ini_read_real(mysec,'ShuffleSongs',0)
        global.__rmspd=         max(ini_read_real(mysec,'framerate',60),1)
        __FrameSkip=            ini_read_real(mysec,'SkipFrames',0)
        __millisecs=            ini_read_real(mysec,'FramesForSkip',1)
        set_synchronization(    ini_read_real(mysec,'VerticalSync',0))
        __monitorpos=           ini_read_real(mysec,'MonitorPositions',0)
        __recursive=            ini_read_real(mysec,'RecursiveFolders',0)
        __buffer_size=          ini_read_real(mysec,'AudioBufferSize',256);
        __skipdrivecheck=       ini_read_real(mysec,'SkipFileDriveCheck',1)
        __allow_balloons=       ini_read_real(mysec,'AllowBalloonNotifications',1)
        __customcaption_idle=   ini_read_string('Caption','customCaptionIdle','elpAudio %v')
        __customcaption_play=   ini_read_string('Caption','customCaptionPlay','(%t1/%ta1) elpAudio %v [%pn/%ps]')
        __customcaption_ch1=    ini_read_string('Caption','customCaptionChange1','(%t1/%ta1) elpAudio %v [%pn/%ps]')
        __customcaption_ch2=    ini_read_string('Caption','customCaptionChange2','(%sn) elpAudio %v [%pn/%ps]')
        __changecaption=        ini_read_real('Caption','changeCaption',1)
        __captionchangespd=     ini_read_real('Caption','captionChangeSpeed',3)*60
    ini_close()
} else {
    var ffff;ffff=file_text_open_write('settings.ini')
    file_text_write_string(ffff,'[General]')
    repeat(2)file_text_writeln(ffff)
    file_text_close(ffff)
}
if argument_count==1 {
    if argument[0] {
        if file_exists(global.__progdir+'playlists\temp.epl') then
            ListLoad(global.__progdir+'playlists\temp.epl',0)
        else
            GetMusicFromFolder(global.__progdir+'music_examples\')
    }
}
__customcaption_idle='elpAudio '+ea_version

//effects
globalvar fx_mixer,fx_osc,fx_lowpass,fx_itlowpass,fx_highpass,fx_echo,fx_flanger,fx_distort,fx_normalize, fx_equaliser, fx_pitchshift,fx_chorus,fx_reverb,fx_vst,fx_winamp,fx_itecho,fx_compressor,fx_sfxreverb,fx_lowpass_simple;

fx_mixer=        1
fx_osc=          2 
fx_lowpass=      3 
fx_itlowpass=    4 
fx_highpass=     5 
fx_echo=         6 
fx_flanger=      7 
fx_distort=      8 
fx_normalize=    9 
fx_equaliser=    10
fx_pitchshift=   11
fx_chorus=       12
fx_reverb=       13
fx_vst=          14
fx_winamp=       15
fx_itecho=       16
fx_compressor=   17
fx_sfxreverb=    18
fx_lowpass_simple=      19
