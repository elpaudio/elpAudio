global.themepath=argument0
if !file_exists(global.themepath) global.themepath=working_directory+'\themes\default\theme.ini'

fontlast=4096

// Icons.

global.__ico_play=  -1//sprButtonPlay
global.__ico_pause= -1//sprButtonPause
global.__ico_stop=  -1//sprButtonStop
global.__ico_next=  -1//sprButtonNext
global.__ico_prev=  -1//sprButtonPrev
global.__ico_float= -1//sprFloatText
global.__ico_stngs= -1//sprButtonSettings
global.__ico_migui= -1//sprGUIControls
global.__ico_alont= -1//sprButtonAlwaysOnTop
global.__ico_admus= -1//sprButtonAddFile
global.__ico_volbt= -1//sprVolumeSlider
global.__ico_slide= -1//sprVolumeSlider2
global.__ico_sortb= -1//sprButtonShuffle
global.__ico_slid2= -1//sprPosSlider
global.__ico_slide2=-1//sprPosSlider2
global.__ico_visua= -1//sprButtonVisualiser
global.__ico_savel= -1//sprButtonSaveList
global.__ico_loadl= -1//sprButtonLoadList
global.__ico_loop=  -1//sprButtonLoop
global.__ico_visfg=-1
global.__ico_front=-1
global.__ico_back=-1
global.__fon_vis=fntVisual
global.__fon_cap=fntCaption
global.__floatbg=-1
global.__floatfg=-1//sprFloatText
global.__floatw=128
global.__floath=32
global.__drawfloattime2=0
global.__floattime2x=0
global.__floattime2y=0
global.__floattime2size=16
global.oldfloat=1
global.themename='elpAudio Default'
global.visualx=336
global.visualy=16
global.visualw=144
global.visualh=64
global.floatalpha=1
global.customvisuals=0
global.plrwidth=480
global.plrheight=80
//with all {visible=1}// depth-=1}
with all image_speed=0

// Colors .

global.color1=c_fuchsia
global.color2=c_aqua
global.visbgcol=c_black
global.visfgcol=c_white
global.floatcolor=c_lime
global.frontcol=$606060
global.captioncol=$FFFFFF
global.floatbgcol=$101010

//do not change this globals
globalvar __visbgcol,__visfgcol,__butplaycol,__butstopcol,__butnextcol,__butprevcol
,__butsettcol
,__butpausecol,__butalontcol,__butaddmuscol,__butvolcol
,__butslidecol,__butslidercol,__butvisualcol
,__butsavelistcol,__butloadlistcol,__butloopcol
,__minibutton1col,__minibutton2col,__minibutton3col
,__floatfgcol,__floatbgcol,__frontmenucol
,__butsortcol,__bgcol
;

// External icons.

if file_exists(argument0) {
//lini_open(argument0)
ini_open(argument0)
if Get_elpAudioVersion()!=ini_read_string('Default','RequiredVersion',Get_elpAudioVersion())
and ini_read_real('Default','RequiredVersion',1.6)<1.6 //last version with environment changes
and !__elp_enable_old_themes
{
show_message('Sorry, but this theme is not suitable for this elpAudio version. elpAudio will now close.#(You can disable this warning in elpAudio settings.)')
EndSession()
}

if ini_key_exists('Default','themeName') {global.themename=ini_read_string('Default','themeName','Default')}
else {ini_close() show_message('That .ini file is not a theme file.') EndSession()}
//play button
if ini_key_exists('Default','plbt') global.__ico_play=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','plbt','butplay.png')               ,2,0,0,0,0)
//pause button
if ini_key_exists('Default','psbt') global.__ico_pause=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','psbt','butpause.png')             ,2,0,0,0,0)
//prev button
if ini_key_exists('Default','prbt') global.__ico_prev=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','prbt','butprev.png')               ,2,0,0,0,0)
//next button
if ini_key_exists('Default','nxbt') global.__ico_next=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','nxbt','butnext.png')               ,2,0,0,0,0)
//stop button
if ini_key_exists('Default','stbt') global.__ico_stop=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','stbt','butstop.png')               ,2,0,0,0,0)
//settings button
if ini_key_exists('Default','snbt') global.__ico_stngs=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','snbt','butstng.png')              ,2,0,0,0,0)
//sort button
if ini_key_exists('Default','srbt') global.__ico_sortb=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','srbt','butsort.png')              ,3,0,0,0,0)
//loop button
if ini_key_exists('Default','lpbt') global.__ico_loop=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','lpbt','butloop.png')              ,3,0,0,0,0)
//add music button
if ini_key_exists('Default','ambt') global.__ico_admus=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','ambt','butaddmus.png')            ,2,0,0,0,0)
//always on top button
if ini_key_exists('Default','atbt') global.__ico_alont=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','atbt','butalont.png')             ,2,0,0,0,0)
//load list button
if ini_key_exists('Default','llbt') global.__ico_loadl=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','llbt','butloadlist.png')          ,2,0,0,0,0)
//save list button
if ini_key_exists('Default','slbt') global.__ico_savel=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','slbt','butsavelist.png')          ,2,0,0,0,0)
//visual button
if ini_key_exists('Default','vibt') global.__ico_visua=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','vibt','butvisual.png')            ,2,0,0,0,0)
//float fg
if ini_key_exists('Default','flot') global.__floatfg=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','flot','floatfg.png')                ,1,0,0,0,0)
//mini gui buttons
if ini_key_exists('Default','mgui') global.__ico_migui=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','mgui','minigui.png')              ,9,0,0,0,0)
//position slide
if ini_key_exists('Default','poss') global.__ico_slid2=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','poss','positionslide.png')        ,2,0,0,0,0)
//posiition slider
if ini_key_exists('Default','slide') global.__ico_slide=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','slide','slider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide,sprite_get_width(global.__ico_slide)/2,sprite_get_height(global.__ico_slide)/2)
//volume slide
if ini_key_exists('Default','vols') global.__ico_volbt=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','vols','volumeslide.png')          ,2,0,0,0,0)
//volume slider
if ini_key_exists('Default','slide2') global.__ico_slide2=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','slide2','volslider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide2,sprite_get_width(global.__ico_slide2)/2,sprite_get_height(global.__ico_slide2)/2)

if ini_key_exists('Default','useOldFloat') global.oldfloat=ini_read_real('Default','useOldFloat',0)
if ini_key_exists('Default','floatbg') {
if file_exists(filename_path(argument0)+ini_read_string('Default','floatbg','floatbg.png')) global.__floatbg=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','floatbg','floatbg.png')          ,1,0,0,0,0)
else global.__floatbg=-1
} else global.__floatbg=-1

if ini_key_exists('Default','floatfg') {
if file_exists(filename_path(argument0)+ini_read_string('Default','floatfg','floatfg.png')) global.__floatfg=SpritePull(-1,filename_path(argument0)+ini_read_string('Default','floatfg','floatfg.png')          ,1,0,0,0,0)
else global.__floatfg=-1
} else global.__floatfg=-1

if ini_key_exists('Default','visFont') {
global.__fon_vis_size=ini_read_real('Default','visSize',16)
global.__fon_vis=font_add_file(filename_path(argument0)+ini_read_string('Default','visFont','visual.ttf'),
ini_read_string('Default','visName','Terminal'),
global.__fon_vis_size,ini_read_real('Default','visIsBold',0),ini_read_real('Default','visIsItalic',0),0,fontlast)
}

if ini_key_exists('Default','captionFont') {
global.__fon_cap_size=ini_read_real('Default','capSize',16)
global.__fon_cap=font_add_file(filename_path(argument0)+ini_read_string('Default','captionFont','tahoma.ttf'),
ini_read_string('Default','captionName','Tahoma'),
global.__fon_cap_size,ini_read_real('Default','capIsBold',0),ini_read_real('Default','capIsItalic',0),0,fontlast)
}

//ini_close()
}

global.changeview=1
LoadThemeGUI(argument0)
LoadThemeCols()

ini_close()
