with ButtonSettings instance_destroy()
fontlast=$FFFF

LoadVisualisers();

mybutton=Visualiser
global.visualx=ini_read_real('Interface','visX',336)
global.visualy=ini_read_real('Interface','visY',16)
global.visualw=ini_read_real('Interface','visW',144)
if global.visualw==0 global.visualw=display_get_width()
global.visualh=ini_read_real('Interface','visH',64)
if global.visualh==0 global.visualh=display_get_height()
mybutton.x=global.visualx
mybutton.y=global.visualy
mybutton.width=global.visualw
mybutton.height=global.visualh
mybutton.surf1=surface_create(global.visualw,global.visualh)
mybutton.surf2=surface_create(global.visualw,global.visualh)
mybutton.usefgvisimg=ini_read_real('Interface','usefgvisimg',0)
mybutton.visfgimg=sprite_add(fname_path(argument0)+ini_read_string('Interface','visfgimg','vis_fg.png'),1,0,0,0,0)
mybutton.visfgx=ini_read_real('Interface','visfgx',0)
mybutton.visfgy=ini_read_real('Interface','visfgy',0)
mybutton.visfgw=ini_read_real('Interface','visfgw',0)
mybutton.visfgh=ini_read_real('Interface','visfgh',0)
mybutton.usebgvisimg=ini_read_real('Interface','usebgvisimg',0)
mybutton.visbgimg=sprite_add(fname_path(argument0)+ini_read_string('Interface','visbgimg','vis_bg.png'),1,0,0,0,0)
mybutton.visbgx=ini_read_real('Interface','visbgx',0)
mybutton.visbgy=ini_read_real('Interface','visbgy',0)
mybutton.visbgw=ini_read_real('Interface','visbgw',0)
mybutton.visbgh=ini_read_real('Interface','visbgh',0)

if ini_read_real('Default','drawVisualiser',1) {
if !instance_exists(Visualiser) instance_create(global.visualx,global.visualy,Visualiser)
if !instance_exists(Visualiser) instance_create(global.visualx,global.visualy,ButtonVisualiser)
} else {
with Visualiser instance_destroy()
with ButtonVisualiser instance_destroy()
}



mybutton=ButtonLoop
mybutton.x=ini_read_real('Interface','butloopx',64)
mybutton.y=ini_read_real('Interface','butloopy',64)

mybutton=ButtonPlay
mybutton.x=ini_read_real('Interface','butplayx',64)
mybutton.y=ini_read_real('Interface','butplayy',16)

mybutton=ButtonAddFile
mybutton.x=ini_read_real('Interface','butmusaddx',64)
mybutton.y=ini_read_real('Interface','butmusaddy',16)

mybutton=ButtonVisualiser
mybutton.x=ini_read_real('Interface','butchngvisx',64)
mybutton.y=ini_read_real('Interface','butchngvisy',16)

mybutton=ButtonShuffle
mybutton.x=ini_read_real('Interface','butsortx',64)
mybutton.y=ini_read_real('Interface','butsorty',16)

mybutton=ButtonAlwaysOnTop
mybutton.x=ini_read_real('Interface','butontopx',64)
mybutton.y=ini_read_real('Interface','butontopy',16)

mybutton=ButtonStop
mybutton.x=ini_read_real('Interface','butstopx',64)
mybutton.y=ini_read_real('Interface','butstopy',16)

mybutton=ButtonPause
mybutton.x=ini_read_real('Interface','butpausex',64)
mybutton.y=ini_read_real('Interface','butpausey',16)

mybutton=ButtonNext
mybutton.x=ini_read_real('Interface','butnextx',64)
mybutton.y=ini_read_real('Interface','butnexty',16)

mybutton=ButtonPrev
mybutton.x=ini_read_real('Interface','butprevx',64)
mybutton.y=ini_read_real('Interface','butprevy',16)

//float text
mybutton=FloatText

mybutton.x=ini_read_real('Interface','floaterx',64)
mybutton.y=ini_read_real('Interface','floatery',16)
mybutton.width=ini_read_real('Interface','floaterw',128)
mybutton.height=ini_read_real('Interface','floaterh',32)

mybutton.textx=ini_read_real('Interface','floattextx',4)
mybutton.texty=ini_read_real('Interface','floattexty',1)
mybutton.oldfloatw=ini_read_real('Interface','floattextw',128)
mybutton.text_centered=ini_read_real('Interface','floattextcentered',0)

mybutton.floatdrawtime1=ini_read_real('Interface','floatdrawtime1',0)
mybutton.drawfloattime2=ini_read_real('Interface','floatdrawtime2',0)
mybutton.time2x=ini_read_real('Interface','floattime2x',0)
mybutton.time2y=ini_read_real('Interface','floattime2y',0)
mybutton.time2font=font_add_file(fname_path(argument0)+ini_rs('Interface','floattime2ffile','tahoma.ttf'),ini_read_string('Interface','floattime2font','Tahoma'),
                    ini_read_real('Interface','floattime2Size',0),ini_read_real('Interface','floattime2IsBold',0),
                    ini_read_real('Interface','floattime2IsItalic',0),0,fontlast)
mybutton.drawqueue=ini_read_real('Interface','floatdrawqueue',0)
mybutton.queuefont=font_add_file(fname_path(argument0)+ini_rs('Interface','floatqueueffile','tahoma.ttf'),ini_read_string('Interface','floatqueuefont','Tahoma'),
                    ini_read_real('Interface','floatqueueSize',0),ini_read_real('Interface','floatqueueIsBold',0),
                    ini_read_real('Interface','floatqueueIsItalic',0),0,fontlast)
mybutton.queuex=ini_read_real('Interface','floatqueuex',0)
mybutton.queuey=ini_read_real('Interface','floatqueuey',0)
mybutton.queuecol1=HexToColor(real_hex(ini_read_string('Interface','floatqueuecol1','$000000')))
mybutton.queuecol2=HexToColor(real_hex(ini_read_string('Interface','floatqueuecol2','$FFFFFF')))
mybutton.floatiertext=ini_read_real('Interface','floatTextFloat',1)


mybutton.ontop=ini_read_real('Default','floatontop',1)

mybutton.usefgimg=ini_read_real('Interface','floatusefgimg',1)
mybutton.usebgimg=ini_read_real('Interface','floatusebgimg',1)

mybutton.floattime2col1=HexToColor(real_hex(ini_read_string('Interface','floattime2col1','$000000')))
mybutton.floattime2col2=HexToColor(real_hex(ini_read_string('Interface','floattime2col2','$FFFFFF')))

mybutton.drawcursong=ini_read_real('Interface','floatdrawcursong',0)


mybutton=VolumeSlider
mybutton.x=ini_read_real('Interface','butvolx',64)
mybutton.y=ini_read_real('Interface','butvoly',16)
mybutton.vertical=ini_read_real('Default','verticalVolumeSlide',0)

mybutton=PosSlider
mybutton.x=ini_read_real('Interface','sliderx',64)
mybutton.y=ini_read_real('Interface','slidery',16)


MainMenu.x=ini_read_real('Interface','frontmenux',64)
MainMenu.y=ini_read_real('Interface','frontmenuy',16)
MainMenu.w=ini_read_real('Interface','frontmenuw',480)
MainMenu.h=ini_read_real('Interface','frontmenuh',16)
MainMenu.textx=ini_read_real('Interface','frontmenutextx',0)
MainMenu.texty=ini_read_real('Interface','frontmenutexty',0)
MainMenu.useimgforfront=ini_read_real('Interface','useimgforfront',0)
global.__img_front=SpritePull(-1,fname_path(argument0)+ini_read_string('Interface','imgfront','front.png'),1,0,0,0,0)
MainMenu.useimgforback=ini_read_real('Interface','useimgforback',0)

with BackgroundHolder instance_destroy()
with Monoster instance_destroy()
mybutton=instance_create(0,0,BackgroundHolder)

ff=fname_path(argument0)+ini_rs('Interface','imgback','back.png')
//show_message(ff)
global.__img_back=sprite_add(ff,1,0,0,0,0)
mybutton.useimgforback=ini_read_real('Interface','useimgforback',0)
mybutton.backx=ini_read_real('Interface','backx',0)
mybutton.backy=ini_read_real('Interface','backy',0)
mybutton.backw=ini_read_real('Interface','backw',480)
mybutton.backh=ini_read_real('Interface','backh',80)

mybutton=instance_create(0,0,Monoster)
mybutton.usemonoster=ini_read_real('Interface','usemonoster',0)
mybutton.monosterimg=SpritePull(-1,fname_path(argument0)+ini_read_string('Interface','monosterimg','monoster.png'),2,0,0,0,0)
mybutton.monosterx=ini_read_real('Interface','monosterx',0)
mybutton.monostery=ini_read_real('Interface','monostery',0)

MainMenu.drawcaption=ini_read_real('Interface','drawcaption',1)
//}

with(ButtonGUIControls) instance_destroy()
i=0
repeat 3 {
me=instance_create(ini_read_real("Interface","miniguix"+string(i+1),64),ini_read_real("Interface","miniguix"+string(i+1),64),ButtonGUIControls)
me.button=i
me.image_index=3*me.button
me.x=ini_read_real('Interface','miniguix'+string(i+1),64)
me.y=ini_read_real('Interface','miniguiy'+string(i+1),16)
sprite_collision_mask(global.__ico_migui,1,0,0,0,0,0,0,0)
i+=1
}

mybutton=instance_create(0,0,ButtonSettings)
mybutton.x=ini_read_real('Interface','butsetx',336)
mybutton.y=ini_read_real('Interface','butsety',336)

global.plrwidth=ini_read_real('Interface','playerW',480)
if global.plrwidth=0 global.plrwidth=display_get_width()
global.plrheight=ini_read_real('Interface','playerH',80)
if global.plrheight=0 global.plrheight=display_get_height()

global.__colfile=fname_path(global.themepath)+ini_read_string('Default','colorfile','theme_colors.ini')
ini_close()
