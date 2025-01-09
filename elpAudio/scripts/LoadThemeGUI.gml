fontlast=$FFFF
mysec='Interface'

global.visx=ini_read_real(mysec,'visX',320)
global.visy=ini_read_real(mysec,'visY',16)
global.visw=ini_read_real(mysec,'visW',360)
global.vish=ini_read_real(mysec,'visH',64)


if ini_read_real('Default','drawVisualiser',1) {
mbtn=Visualiser
mbtn.x=global.visx
mbtn.y=global.visy
mbtn.width=global.visw
mbtn.height=global.vish
mbtn.surf1=surface_create(global.visw,global.vish)
mbtn.surf2=surface_create(global.visw,global.vish)
mbtn.usefgvisimg=ini_read_real(mysec,'usefgvisimg',0)
var mbb;
mbb=-1
if variable_instance_exists(mbtn,'visfgimg') mbb=mbtn.visfgimg
mbtn.visfgimg=SpritePull(mbb,fname_path(argument0)+ini_read_string(mysec,'visfgimg','vis_fg.png'),1,0,0,0,0)
mbtn.visfgx=ini_read_real(mysec,'visfgx',0)
mbtn.visfgy=ini_read_real(mysec,'visfgy',0)
mbtn.visfgw=ini_read_real(mysec,'visfgw',0)
mbtn.visfgh=ini_read_real(mysec,'visfgh',0)
mbtn.usebgvisimg=ini_read_real(mysec,'usebgvisimg',0)
mbb=-1
if variable_instance_exists(mbtn,'visbgimg') mbb=mbtn.visbgimg
mbtn.visbgimg=SpritePull(mbb,fname_path(argument0)+ini_read_string(mysec,'visbgimg','vis_bg.png'),1,0,0,0,0)
mbtn.visbgx=ini_read_real(mysec,'visbgx',0)
mbtn.visbgy=ini_read_real(mysec,'visbgy',0)
mbtn.visbgw=ini_read_real(mysec,'visbgw',0)
mbtn.visbgh=ini_read_real(mysec,'visbgh',0)
LoadVisualisers();
} else {
with Visualiser instance_destroy()
with ButtonVisualiser instance_destroy()
}



mbtn=ButtonLoop
mbtn.x=ini_read_real(mysec,'butloopx',64)
mbtn.y=ini_read_real(mysec,'butloopy',64)

mbtn=ButtonPlay
mbtn.x=ini_read_real(mysec,'butplayx',64)
mbtn.y=ini_read_real(mysec,'butplayy',16)

mbtn=ButtonAddFile
mbtn.x=ini_read_real(mysec,'butmusaddx',64)
mbtn.y=ini_read_real(mysec,'butmusaddy',16)

mbtn=ButtonVisualiser
mbtn.x=ini_read_real(mysec,'butchngvisx',64)
mbtn.y=ini_read_real(mysec,'butchngvisy',16)

mbtn=ButtonShuffle
mbtn.x=ini_read_real(mysec,'butsortx',64)
mbtn.y=ini_read_real(mysec,'butsorty',16)

mbtn=ButtonAlwaysOnTop
mbtn.x=ini_read_real(mysec,'butontopx',64)
mbtn.y=ini_read_real(mysec,'butontopy',16)

mbtn=ButtonStop
mbtn.x=ini_read_real(mysec,'butstopx',64)
mbtn.y=ini_read_real(mysec,'butstopy',16)

mbtn=ButtonPause
mbtn.x=ini_read_real(mysec,'butpausex',64)
mbtn.y=ini_read_real(mysec,'butpausey',16)

mbtn=ButtonNext
mbtn.x=ini_read_real(mysec,'butnextx',64)
mbtn.y=ini_read_real(mysec,'butnexty',16)

mbtn=ButtonPrev
mbtn.x=ini_read_real(mysec,'butprevx',64)
mbtn.y=ini_read_real(mysec,'butprevy',16)

//float text
    mbtn=FloatText

    mbtn.x=ini_read_real(mysec,'floaterx',64)
    mbtn.y=ini_read_real(mysec,'floatery',16)
    mbtn.width=ini_read_real(mysec,'floaterw',128)
    mbtn.height=ini_read_real(mysec,'floaterh',32)

    mbtn.textx=ini_read_real(mysec,'floattextx',4)
    mbtn.texty=ini_read_real(mysec,'floattexty',1)
    mbtn.oldfloatw=ini_read_real(mysec,'floattextw',128)
    mbtn.text_centered=ini_read_real(mysec,'floattextcentered',0)

    mbtn.floatdrawtime1=ini_read_real(mysec,'floatdrawtime1',0)
    mbtn.drawfloattime2=ini_read_real(mysec,'floatdrawtime2',0)
    mbtn.time2x=ini_read_real(mysec,'floattime2x',0)
    mbtn.time2y=ini_read_real(mysec,'floattime2y',0)
    mbb=-1
    if variable_instance_exists(mbtn,'time2font') mbb=mbtn.time2font
    mbtn.time2font=FontPull(mbb,fname_path(argument0)+ini_rs(mysec,'floattime2ffile','tahoma.ttf'),ini_read_string(mysec,'floattime2font','Tahoma'),
                    ini_read_real(mysec,'floattime2Size',0),ini_read_real(mysec,'floattime2IsBold',0),
                    ini_read_real(mysec,'floattime2IsItalic',0),0,fontlast)
    mbtn.drawqueue=ini_read_real(mysec,'floatdrawqueue',0)
    mbb=-1
    if variable_instance_exists(mbtn,'queuefont') mbb=mbtn.queuefont
    mbtn.queuefont=FontPull(mbb,fname_path(argument0)+ini_rs(mysec,'floatqueueffile','tahoma.ttf'),ini_read_string(mysec,'floatqueuefont','Tahoma'),
                    ini_read_real(mysec,'floatqueueSize',0),ini_read_real(mysec,'floatqueueIsBold',0),
                    ini_read_real(mysec,'floatqueueIsItalic',0),0,fontlast)
    mbtn.queuex=ini_read_real(mysec,'floatqueuex',0)
    mbtn.queuey=ini_read_real(mysec,'floatqueuey',0)
    mbtn.queuecol1=HexToColor(real_hex(ini_read_string(mysec,'floatqueuecol1','$000000')))
    mbtn.queuecol2=HexToColor(real_hex(ini_read_string(mysec,'floatqueuecol2','$FFFFFF')))
    mbtn.floatiertext=ini_read_real(mysec,'floatTextFloat',1)

    mbtn.ontop=ini_read_real('Default','floatontop',1)

    mbtn.usefgimg=ini_read_real(mysec,'floatusefgimg',1)
    mbtn.usebgimg=ini_read_real(mysec,'floatusebgimg',1)

    mbtn.floattime2col1=HexToColor(real_hex(ini_read_string(mysec,'floattime2col1','$000000')))
    mbtn.floattime2col2=HexToColor(real_hex(ini_read_string(mysec,'floattime2col2','$FFFFFF')))

    mbtn.drawcursong=ini_read_real(mysec,'floatdrawcursong',0)

//volume slider
    mbtn=VolumeSlider
    mbtn.x=ini_read_real(mysec,'butvolx',64)
    mbtn.y=ini_read_real(mysec,'butvoly',16)
    mbtn.vertical=ini_read_real('Default','verticalVolumeSlide',0)

//position slider
    mbtn=PosSlider
    mbtn.x=ini_read_real(mysec,'sliderx',64)
    mbtn.y=ini_read_real(mysec,'slidery',16)

//main menu
    MainMenu.x=ini_read_real(mysec,'frontmenux',64)
    MainMenu.y=ini_read_real(mysec,'frontmenuy',16)
    MainMenu.w=ini_read_real(mysec,'frontmenuw',480)
    MainMenu.h=ini_read_real(mysec,'frontmenuh',16)
    MainMenu.textx=ini_read_real(mysec,'frontmenutextx',0)
    MainMenu.texty=ini_read_real(mysec,'frontmenutexty',0)
    MainMenu.useimgforfront=ini_read_real(mysec,'useimgforfront',0)
    mbb=-1
    if variable_instance_exists(MainMenu,'imgfront') mbb=MainMenu.imgfront
    MainMenu.imgfront=SpritePull(mbb,fname_path(argument0)+ini_read_string(mysec,'imgfront','front.png'),1,0,0,0,0)

if ini_read_real(mysec,'useimgforback',0) {
    mbtn=instance_create(0,0,BackgroundHolder)
    ff=fname_path(argument0)+ini_rs(mysec,'imgback','back.png')
    mbb=-1
    if variable_instance_exists(mbtn,'imgback') mbb=mbtn.imgback
    mbtn.imgback=SpritePull(mbb,ff,1,0,0,0,0)
    mbtn.x=ini_read_real(mysec,'backx',0)
    mbtn.y=ini_read_real(mysec,'backy',0)
    mbtn.w=ini_read_real(mysec,'backw',480)
    mbtn.h=ini_read_real(mysec,'backh',80)
}

if ini_read_real(mysec,'usemonoster',0) {
    mbtn=instance_create(0,0,Monoster)
    mbb=-1
    if variable_instance_exists(mbtn,'monosterimg') mbb=mbtn.monosterimg
    mbtn.monosterimg=SpritePull(mbb,fname_path(argument0)+ini_read_string(mysec,'monosterimg','monoster.png'),2,0,0,0,0)
    mbtn.x=ini_read_real(mysec,'monosterx',0)
    mbtn.y=ini_read_real(mysec,'monostery',0)
}

MainMenu.drawcaption=ini_read_real(mysec,'drawcaption',1)

with(ButtonGUIControls) instance_destroy()
i=0
repeat 3 {
    me=instance_create(ini_read_real("Interface","miniguix"+string(i+1),64),ini_read_real("Interface","miniguix"+string(i+1),64),ButtonGUIControls)
    me.button=i
    me.image_index=3*me.button
    me.x=ini_read_real(mysec,'miniguix'+string(i+1),64)
    me.y=ini_read_real(mysec,'miniguiy'+string(i+1),16)
    sprite_collision_mask(global.__ico_migui,1,0,0,0,0,0,0,0)
    i+=1
}

//settings button
    mbtn=ButtonSettings
    mbtn.x=ini_read_real(mysec,'butsetx',336)
    mbtn.y=ini_read_real(mysec,'butsety',336)

global.plrwidth=ini_read_real(mysec,'playerW',480)
if global.plrwidth=0 global.plrwidth=display_get_width()
global.plrheight=ini_read_real(mysec,'playerH',80)
if global.plrheight=0 global.plrheight=display_get_height()

global.__colfile=fname_path(global.themepath)+ini_read_string('Default','colorfile','theme_colors.ini')
ini_close()
