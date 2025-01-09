global.themepath=argument0
if !file_exists(global.themepath) global.themepath=working_directory+'\themes\default\theme.ini'

var fontlast;fontlast=4096
var mysec;mysec='Default'

// Icons.

global.__ico_play=  -1
global.__ico_pause= -1
global.__ico_stop=  -1
global.__ico_next=  -1
global.__ico_prev=  -1
global.__ico_float= -1
global.__ico_stngs= -1
global.__ico_migui= -1
global.__ico_alont= -1
global.__ico_admus= -1
global.__ico_volbt= -1
global.__ico_slide= -1
global.__ico_sortb= -1
global.__ico_slid2= -1
global.__ico_slide2=-1
global.__ico_visua= -1
global.__ico_loop=  -1
global.__ico_visfg= -1
global.__ico_front= -1
global.__ico_back=  -1
global.__fon_vis=   -1
global.__fon_cap=   -1
global.__floatbg=   -1
global.__floatfg=   -1
global.__floatw=128
global.__floath=32
global.__drawfloattime2=0
global.__floattime2x=0
global.__floattime2y=0
global.__floattime2size=16
global.oldfloat=1
global.themename='elpAudio Default'
global.visx=336
global.visy=16
global.visw=144
global.vish=64
global.floatalpha=1
global.customvisuals=0
global.plrwidth=480
global.plrheight=80
with all image_speed=0

// Colors.

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

if file_exists(global.themepath) {
ini_open(global.themepath)
if Get_elpAudioVersion()!=ini_read_string(mysec,'RequiredVersion',Get_elpAudioVersion())
and ini_read_real(mysec,'RequiredVersion',1.6)<1.6 //last version with button changes
and !__elp_enable_old_themes
{
show_message('Sorry, but this theme is not suitable for this elpAudio version. elpAudio will now close.#(You can disable this warning in elpAudio settings.)')
EndSession()
}

if ini_key_exists(mysec,'themeName') {global.themename=ini_read_string(mysec,'themeName','Default')}
else {ini_close() show_message('That .ini file is not a theme file.') EndSession()}
//play button
global.__ico_play=SpritePull(global.__ico_play,filename_path(argument0)+ini_read_string(mysec,'plbt','butplay.png')               ,2,0,0,0,0)
//pause button
global.__ico_pause=SpritePull(global.__ico_pause,filename_path(argument0)+ini_read_string(mysec,'psbt','butpause.png')             ,2,0,0,0,0)
//prev button
global.__ico_prev=SpritePull(global.__ico_prev,filename_path(argument0)+ini_read_string(mysec,'prbt','butprev.png')               ,2,0,0,0,0)
//next button
global.__ico_next=SpritePull(global.__ico_next,filename_path(argument0)+ini_read_string(mysec,'nxbt','butnext.png')               ,2,0,0,0,0)
//stop button
global.__ico_stop=SpritePull(global.__ico_stop,filename_path(argument0)+ini_read_string(mysec,'stbt','butstop.png')               ,2,0,0,0,0)
//settings button
global.__ico_stngs=SpritePull(global.__ico_stngs,filename_path(argument0)+ini_read_string(mysec,'snbt','butstng.png')              ,2,0,0,0,0)
//sort button
global.__ico_sortb=SpritePull(global.__ico_sortb,filename_path(argument0)+ini_read_string(mysec,'srbt','butsort.png')              ,3,0,0,0,0)
//loop button
global.__ico_loop=SpritePull(global.__ico_loop,filename_path(argument0)+ini_read_string(mysec,'lpbt','butloop.png')              ,3,0,0,0,0)
//add music button
global.__ico_admus=SpritePull(global.__ico_admus,filename_path(argument0)+ini_read_string(mysec,'ambt','butaddmus.png')            ,2,0,0,0,0)
//always on top button
global.__ico_alont=SpritePull(global.__ico_alont,filename_path(argument0)+ini_read_string(mysec,'atbt','butalont.png')             ,2,0,0,0,0)
//visual button
global.__ico_visua=SpritePull(global.__ico_visua,filename_path(argument0)+ini_read_string(mysec,'vibt','butvisual.png')            ,2,0,0,0,0)
//mini gui buttons
global.__ico_migui=SpritePull(global.__ico_migui,filename_path(argument0)+ini_read_string(mysec,'mgui','minigui.png')              ,9,0,0,0,0)
//position slide
global.__ico_slid2=SpritePull(global.__ico_slid2,filename_path(argument0)+ini_read_string(mysec,'poss','positionslide.png')        ,2,0,0,0,0)
//position slider
global.__ico_slide=SpritePull(global.__ico_slide,filename_path(argument0)+ini_read_string(mysec,'slide','slider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide,sprite_get_width(global.__ico_slide)/2,sprite_get_height(global.__ico_slide)/2)
//volume slide
global.__ico_volbt=SpritePull(global.__ico_volbt,filename_path(argument0)+ini_read_string(mysec,'vols','volumeslide.png')          ,2,0,0,0,0)
//volume slider
global.__ico_slide2=SpritePull(global.__ico_slide2,filename_path(argument0)+ini_read_string(mysec,'slide2','volslider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide2,sprite_get_width(global.__ico_slide2)/2,sprite_get_height(global.__ico_slide2)/2)

global.oldfloat=ini_read_real(mysec,'useOldFloat',0)

if file_exists(filename_path(argument0)+ini_read_string(mysec,'floatbg','floatbg.png')) global.__floatbg=SpritePull(global.__floatbg,filename_path(argument0)+ini_read_string(mysec,'floatbg','floatbg.png')          ,1,0,0,0,0)
else global.__floatbg=-1

if file_exists(filename_path(argument0)+ini_read_string(mysec,'floatfg','floatfg.png')) global.__floatfg=SpritePull(global.__floatfg,filename_path(argument0)+ini_read_string(mysec,'floatfg','floatfg.png')          ,1,0,0,0,0)
else global.__floatfg=-1

global.__fon_vis=FontPull(global.__fon_vis,filename_path(argument0)+ini_read_string(mysec,'visFont','visual.ttf'),
ini_read_string(mysec,'visName','Terminal'),
ini_read_real(mysec,'visSize',16),ini_read_real(mysec,'visIsBold',0),ini_read_real(mysec,'visIsItalic',0),0,fontlast)

global.__fon_cap=FontPull(global.__fon_cap,filename_path(argument0)+ini_read_string(mysec,'captionFont','tahoma.ttf'),
ini_read_string(mysec,'captionName','Tahoma'),
ini_read_real(mysec,'capSize',16),ini_read_real(mysec,'capIsBold',0),ini_read_real(mysec,'capIsItalic',0),0,fontlast)

}

LoadThemeGUI(global.themepath)
LoadThemeCols()

ini_close()
