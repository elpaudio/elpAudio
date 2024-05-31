//Call this when the game starts to create the dll interface
//returns nothing... GM will stop if the dll could not be linked

//NOTE: You must have GMFMODSimple.dll and fmodex.dll in your game directory

//Example call
//When the game starts
//LoadFMOD();
globalvar GMFMODSimpledll; GMFMODSimpledll = "lib_audio.dll";
if !file_exists(GMFMODSimpledll) show_debug_message("File not found: lib_audio.dll#In directory: " + working_directory);

var WTF;
WTF = true;
//export double FMODfree(void)
global.dll_FMODfree=external_define(GMFMODSimpledll,"FMODfree",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODfree")
if error_occurred {show_message("Can't load DLLs. It is a known Game Maker bug.#To fix that, restart the computer or write me a message to:#Discord: elpoep")}
//export double FMODinit(double maxsounds, supportwebmusic)
global.dll_FMODinit=external_define(GMFMODSimpledll,"FMODinit",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODinit")
//export double FMODSoundSetEffects(double sound, double effects)
global.dll_FMODSoundSetEffects=external_define(GMFMODSimpledll,"FMODSoundSetEffects",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetEffects")
//export double FMODSoundSetGroup(double sound, double group)
global.dll_FMODSoundSetGroup=external_define(GMFMODSimpledll,"FMODSoundSetGroup",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetGroup")
//export double FMODGroupSetVolume(double group, double volume)
global.dll_FMODGroupSetVolume=external_define(GMFMODSimpledll,"FMODGroupSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetVolume")
//export double FMODSoundSetMaxVolume(double sound, double volume)
global.dll_FMODSoundSetMaxVolume=external_define(GMFMODSimpledll,"FMODSoundSetMaxVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetMaxVolume")
//export double FMODSoundLoop(double sound,paused)
global.dll_FMODSoundLoop=external_define(GMFMODSimpledll,"FMODSoundLoop",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundLoop")
//export double FMODSoundPlay(double sound,paused)
global.dll_FMODSoundPlay=external_define(GMFMODSimpledll,"FMODSoundPlay",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundPlay")
//export double FMODSoundLoop3d(double sound, double x, double y, double z,paused)
global.dll_FMODSoundLoop3d=external_define(GMFMODSimpledll,"FMODSoundLoop3d",dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundLoop3d")
//export double FMODSoundPlay3d(double sound, double x, double y, double z,paused)
global.dll_FMODSoundPlay3d=external_define(GMFMODSimpledll,"FMODSoundPlay3d",dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundPlay3d")
//export double FMODInstanceSet3dPosition(double channel,double x,double y,double z)
global.dll_FMODInstanceSet3dPosition=external_define(GMFMODSimpledll,"FMODInstanceSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dPosition")

//export double FMODSoundAdd(LPCSTR soundfile, double threed, double streamed)
global.dll_FMODSoundAdd=external_define(GMFMODSimpledll,"FMODSoundAdd",dll_cdecl,ty_real,3,ty_string,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAdd")


//export double FMODMasterSetVolume(double volume)
global.dll_FMODMasterSetVolume=external_define(GMFMODSimpledll,"FMODMasterSetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODMasterSetVolume")
//export double FMODListenerSetNumber(double number)
global.dll_FMODListenerSetNumber=external_define(GMFMODSimpledll,"FMODListenerSetNumber",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSetNumber")
//export double FMODListenerSet3dPosition(double number, double x, double y, double z)
global.dll_FMODListenerSet3dPosition=external_define(GMFMODSimpledll,"FMODListenerSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSet3dPosition")
//export double FMODSetWorldScale(double scale)
global.dll_FMODSetWorldScale=external_define(GMFMODSimpledll,"FMODSetWorldScale",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSetWorldScale")
//export double FMODSoundSet3dMinMaxDistance(double sound, double Min, double Max)
global.dll_FMODSoundSet3dMinMaxDistance=external_define(GMFMODSimpledll,"FMODSoundSet3dMinMaxDistance",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dMinMaxDistance")
//export double FMODUpdate()
global.dll_FMODUpdate=external_define(GMFMODSimpledll,"FMODUpdate",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdate")
//export double FMODSoundFree(double sound)
global.dll_FMODSoundFree=external_define(GMFMODSimpledll,"FMODSoundFree",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundFree")
//export double FMODGroupStop(double group)
global.dll_FMODGroupStop=external_define(GMFMODSimpledll,"FMODGroupStop",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupStop")
//export double FMODAllStop()
global.dll_FMODAllStop=external_define(GMFMODSimpledll,"FMODAllStop",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODAllStop")
//export double FMODInstanceStop(double instance)
global.dll_FMODInstanceStop=external_define(GMFMODSimpledll,"FMODInstanceStop",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceStop")
//export double FMODInstanceIsPlaying(double instance)
global.dll_FMODInstanceIsPlaying=external_define(GMFMODSimpledll,"FMODInstanceIsPlaying",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceIsPlaying")
//export double FMODGroupSetMuted(double group, double mute)
global.dll_FMODGroupSetMuted=external_define(GMFMODSimpledll,"FMODGroupSetMuted",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetMuted")
//export double FMODInstanceSetMuted(double instance, double mute)
global.dll_FMODInstanceSetMuted=external_define(GMFMODSimpledll,"FMODInstanceSetMuted",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetMuted")
//export double FMODInstanceSetVolume(double instance, double volume)
global.dll_FMODInstanceSetVolume=external_define(GMFMODSimpledll,"FMODInstanceSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetVolume")
//export double FMODGroupSetPaused(double group, double mute)
global.dll_FMODGroupSetPaused=external_define(GMFMODSimpledll,"FMODGroupSetPaused",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPaused")
//export double FMODInstanceSetPaused(double instance, double mute)
global.dll_FMODInstanceSetPaused=external_define(GMFMODSimpledll,"FMODInstanceSetPaused",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPaused")
//export double FMODGetLastError(void)
global.dll_FMODGetLastError=external_define(GMFMODSimpledll,"FMODGetLastError",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODGetLastError")
//export double FMODListenerHearsDistanceOnly(double number, double t)
global.dll_FMODListenerHearsDistanceOnly=external_define(GMFMODSimpledll,"FMODListenerHearsDistanceOnly",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerHearsDistanceOnly")
//export double FMODSetDopplerFPS(double fps)
global.dll_FMODSetDopplerFPS=external_define(GMFMODSimpledll,"FMODSetDopplerFPS",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSetDopplerFPS")
//export double FMODListenerSet3dPositionEx(double number, double x, double y, double z, double fx, double fy, double fz, double ux, double uy, double uz)
global.dll_FMODListenerSet3dPositionEx=external_define(GMFMODSimpledll,"FMODListenerSet3dPositionEx",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODListenerSet3dPositionEx")
//export double FMODSoundSet3dDopplerMax(double sound, double max)
global.dll_FMODSoundSet3dDopplerMax=external_define(GMFMODSimpledll,"FMODSoundSet3dDopplerMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dDopplerMax")
//export double FMODInstanceSetFrequency(double instance, double freq)
global.dll_FMODInstanceSetFrequency=external_define(GMFMODSimpledll,"FMODInstanceSetFrequency",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetFrequency")
//export double FMODInstanceGetFrequency(double instance)
global.dll_FMODInstanceGetFrequency=external_define(GMFMODSimpledll,"FMODInstanceGetFrequency",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetFrequency")
//export double FMODSoundSet3dCone(double sound, double insideconeangle, double outsideconeangle, double outsidevolume)
global.dll_FMODSoundSet3dCone=external_define(GMFMODSimpledll,"FMODSoundSet3dCone",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSet3dCone")
//export double FMODInstanceSet3dConeOrientation(double instance, double x, double y, double z)
global.dll_FMODInstanceSet3dConeOrientation=external_define(GMFMODSimpledll,"FMODInstanceSet3dConeOrientation",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dConeOrientation")
//export double FMODGroupSetFrequency(double group, double freq)
global.dll_FMODGroupSetFrequency=external_define(GMFMODSimpledll,"FMODGroupSetFrequency",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetFrequency")

//export double FMODGroupGetVolume(double group)
global.dll_FMODGroupGetVolume=external_define(GMFMODSimpledll,"FMODGroupGetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetVolume")
//export double FMODGroupGetPitch(double group)
global.dll_FMODGroupGetPitch=external_define(GMFMODSimpledll,"FMODGroupGetPitch",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetPitch")
//export double FMODGroupGetPaused(double group)
global.dll_FMODGroupGetPaused=external_define(GMFMODSimpledll,"FMODGroupGetPaused",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetPaused")
//export double FMODGroupGetMuted(double group)
global.dll_FMODGroupGetMuted=external_define(GMFMODSimpledll,"FMODGroupGetMuted",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetMuted")
//export double FMODGroupSetPitch(double group,double pitch)
global.dll_FMODGroupSetPitch=external_define(GMFMODSimpledll,"FMODGroupSetPitch",dll_cdecl,ty_real,2,ty_real, ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPitch")
//export double FMODInstanceGetVolume(double instance)
global.dll_FMODInstanceGetVolume=external_define(GMFMODSimpledll,"FMODInstanceGetVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetVolume")

//export double FMODInstanceGetSound(double instance)
global.dll_FMODInstanceGetSound=external_define(GMFMODSimpledll,"FMODInstanceGetSound",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetSound")

//export double FMODSoundGetMaxVolume(double sound)
global.dll_FMODSoundGetMaxVolume=external_define(GMFMODSimpledll,"FMODSoundGetMaxVolume",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMaxVolume")
//export double FMODInstanceGetPaused(double instance)
global.dll_FMODInstanceGetPaused=external_define(GMFMODSimpledll,"FMODInstanceGetPaused",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPaused")
//export double FMODInstanceGetMuted(double instance)
global.dll_FMODInstanceGetMuted=external_define(GMFMODSimpledll,"FMODInstanceGetMuted",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetMuted")

//export double FMODSoundAddEffect(LPCSTR soundfile, double effect, double pos)
global.dll_FMODSoundAddEffect=external_define(GMFMODSimpledll,"FMODSoundAddEffect",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAddEffect")

//export double FMODInstanceGetPosition(double instance)
global.dll_FMODInstanceGetPosition=external_define(GMFMODSimpledll,"FMODInstanceGetPosition",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPosition")

//export double FMODInstanceSetPosition(double instance, double p)
global.dll_FMODInstanceSetPosition=external_define(GMFMODSimpledll,"FMODInstanceSetPosition",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPosition")


//export double FMODGroupSetPan(double group, double pan)
global.dll_FMODGroupSetPan=external_define(GMFMODSimpledll,"FMODGroupSetPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupSetPan")

//export double FMODInstanceSetPan(double instance, double p)
global.dll_FMODInstanceSetPan=external_define(GMFMODSimpledll,"FMODInstanceSetPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPan")

//export double FMODInstanceGetPan(double instance)
global.dll_FMODInstanceGetPan=external_define(GMFMODSimpledll,"FMODInstanceGetPan",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPan")

//export double FMODInstanceSetLoopCount(double instance, double p)
global.dll_FMODInstanceSetLoopCount=external_define(GMFMODSimpledll,"FMODInstanceSetLoopCount",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetLoopCount")

//export double FMODInstanceGetLoopCount(double instance)
global.dll_FMODInstanceGetLoopCount=external_define(GMFMODSimpledll,"FMODInstanceGetLoopCount",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetLoopCount")

//export double FMODBlockersInit(double NumBlockers, double xs, double ys, double zs)
global.dll_FMODBlockersInit=external_define(GMFMODSimpledll,"FMODBlockersInit",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockersInit")

//export double FMODBlockersFree()
global.dll_FMODBlockersFree=external_define(GMFMODSimpledll,"FMODBlockersFree",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODBlockersFree")

//export double FMODBlockerAdd(double x, double y, double z, double xs, double ys, double zs, double xe, double ye, double ze)
global.dll_FMODBlockerAdd=external_define(GMFMODSimpledll,"FMODBlockerAdd",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerAdd")

//export double FMODBlockerSet3dPosition(double blocker, double x, double y, double z)
global.dll_FMODBlockerSet3dPosition=external_define(GMFMODSimpledll,"FMODBlockerSet3dPosition",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dPosition")

//export double FMODBlockerSet3dOrientation(double blocker, double fx, double fy, double fz, double ux, double uy, double uz)
global.dll_FMODBlockerSet3dOrientation=external_define(GMFMODSimpledll,"FMODBlockerSet3dOrientation",dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dOrientation")

//export double FMODBlockerSet3dScale(double blocker, double sx, double sy, double sz)
global.dll_FMODBlockerSet3dScale=external_define(GMFMODSimpledll,"FMODBlockerSet3dScale",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSet3dScale")

//export double FMODBlockerSetEnabled(double blocker, double enabled)
global.dll_FMODBlockerSetEnabled=external_define(GMFMODSimpledll,"FMODBlockerSetEnabled",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSetEnabled")

//export double FMODBlockerGetEnabled(double blocker)
global.dll_FMODBlockerGetEnabled=external_define(GMFMODSimpledll,"FMODBlockerSetEnabled",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerGetEnabled")

//export double FMODBlockerGetStrength(double blocker)
global.dll_FMODBlockerGetStrength=external_define(GMFMODSimpledll,"FMODBlockerGetStrength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerGetStrength")

//export double FMODBlockerSetStrength(double blocker,double strength)
global.dll_FMODBlockerSetStrength=external_define(GMFMODSimpledll,"FMODBlockerSetStrength",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODBlockerSetStrength")

//export double FMODGetNumInstances(void)
global.dll_FMODGetNumInstances=external_define(GMFMODSimpledll,"FMODGetNumInstances",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODGetNumInstances")

//export double FMODSetPassword(LPCSTR password)
global.dll_FMODSetPassword=external_define(GMFMODSimpledll,"FMODSetPassword",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODSetPassword")

//export double FMODSoundIsStreamed(double sound)
global.dll_FMODSoundIsStreamed=external_define(GMFMODSimpledll,"FMODSoundIsStreamed",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundIsStreamed")

//export double FMODSoundIs3d(double sound)
global.dll_FMODSoundIs3d=external_define(GMFMODSimpledll,"FMODSoundIs3d",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundIs3d")

//double FMODSoundInstanciate(double sound)
global.dll_FMODSoundInstanciate=external_define(GMFMODSimpledll,"FMODSoundInstanciate",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundInstanciate")

//export double FMODSoundGetMaxDist(double sound)
global.dll_FMODSoundGetMaxDist=external_define(GMFMODSimpledll,"FMODSoundGetMaxDist",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMaxDist")

//export double FMODInstanceSet3dMinMaxDistance(double instance, double Min, double Max)
global.dll_FMODInstanceSet3dMinMaxDistance=external_define(GMFMODSimpledll,"FMODInstanceSet3dMinMaxDistance",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dMinMaxDistance")

//export double FMODInstanceSet3dDopplerMax(double instance, double doppler)
global.dll_FMODInstanceSet3dDopplerMax=external_define(GMFMODSimpledll,"FMODInstanceSet3dDopplerMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dDopplerMax")

//export double FMODInstanceSet3dCone(double instance, double insideconeangle, double outsideconeangle, double outsidevolume)
global.dll_FMODInstanceSet3dCone=external_define(GMFMODSimpledll,"FMODInstanceSet3dCone",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3dCone")


//export double FMODSoundGetNumChannels(double sound)
global.dll_FMODSoundGetNumChannels=external_define(GMFMODSimpledll,"FMODSoundGetNumChannels",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetNumChannels")

//export double FMODInstanceGetMaxDist(double instance)
global.dll_FMODInstanceGetMaxDist=external_define(GMFMODSimpledll,"FMODInstanceGetMaxDist",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetMaxDist")

//export double FMODInstanceGetWaveSnapshot(double instance, double channel, double size, LPSTR Buffer)
global.dll_FMODInstanceGetWaveSnapshot=external_define(GMFMODSimpledll,"FMODInstanceGetWaveSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODInstanceGetWaveSnapshot")

//export double FMODInstanceGetSpectrumSnapshot(double instance, double channel, double size, LPSTR Buffer)
global.dll_FMODInstanceGetSpectrumSnapshot=external_define(GMFMODSimpledll,"FMODInstanceGetSpectrumSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODInstanceGetSpectrumSnapshot")

//export double FMODGroupGetWaveSnapshot(double group, double channel, double size, LPSTR Buffer)
global.dll_FMODGroupGetWaveSnapshot=external_define(GMFMODSimpledll,"FMODGroupGetWaveSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGroupGetWaveSnapshot")

//export double FMODGroupGetSpectrumSnapshot(double group, double channel, double size, LPSTR Buffer)
global.dll_FMODGroupGetSpectrumSnapshot=external_define(GMFMODSimpledll,"FMODGroupGetSpectrumSnapshot",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGroupGetSpectrumSnapshot")




//export double FMODInstanceGetWaveSnapshot2(double instance, double channel, double size)
global.dll_FMODInstanceGetWaveSnapshot2=external_define(GMFMODSimpledll,"FMODInstanceGetWaveSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetWaveSnapshot2")

//export double FMODInstanceGetSpectrumSnapshot2(double instance, double channel, double size)
global.dll_FMODInstanceGetSpectrumSnapshot2=external_define(GMFMODSimpledll,"FMODInstanceGetSpectrumSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetSpectrumSnapshot2")

//export double FMODGroupGetWaveSnapshot2(double group, double channel, double size)
global.dll_FMODGroupGetWaveSnapshot2=external_define(GMFMODSimpledll,"FMODGroupGetWaveSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetWaveSnapshot2")

//export double FMODGroupGetSpectrumSnapshot2(double group, double channel, double size)
global.dll_FMODGroupGetSpectrumSnapshot2=external_define(GMFMODSimpledll,"FMODGroupGetSpectrumSnapshot2",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupGetSpectrumSnapshot2")

//export double FMODNormalizeSpectrumData(double startpos, double size)
global.dll_FMODNormalizeSpectrumData=external_define(GMFMODSimpledll,"FMODNormalizeSpectrumData",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODNormalizeSpectrumData")

//export double FMODNormalizeWaveData(double startpos, double size)
global.dll_FMODNormalizeWaveData=external_define(GMFMODSimpledll,"FMODNormalizeWaveData",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODNormalizeWaveData")

//export double FMODGetSnapshotEntry(double pos)
global.dll_FMODGetSnapshotEntry=external_define(GMFMODSimpledll,"FMODGetSnapshotEntry",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGetSnapshotEntry")

//export double FMODGetWaveBuffer(double startpos, double size, LPSTR Buffer)
global.dll_FMODGetWaveBuffer=external_define(GMFMODSimpledll,"FMODGetWaveBuffer",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGetWaveBuffer")

//export double FMODGetSpectrumBuffer(double startpos, double size, LPSTR Buffer)
global.dll_FMODGetSpectrumBuffer=external_define(GMFMODSimpledll,"FMODGetSpectrumBuffer",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODGetSpectrumBuffer")

//extern double FMODEncryptFile(LPCSTR sourcename, LPCSTR destname, LPCSTR password)
global.dll_FMODEncryptFile=external_define(GMFMODSimpledll,"FMODEncryptFile",dll_cdecl,ty_real,3,ty_string,ty_string,ty_string);
if(WTF) show_debug_message("Defined: FMODEncryptFile")

//export double FMODSoundGetLength(double sound)
global.dll_FMODSoundGetLength=external_define(GMFMODSimpledll,"FMODSoundGetLength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetLength")

//export double FMODInstanceSoundGetLength(double instance)
global.dll_FMODInstanceSoundGetLength=external_define(GMFMODSimpledll,"FMODInstanceSoundGetLength",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSoundGetLength")

//export double FMODInstanceAddEffect(double instance, double effect)
global.dll_FMODInstanceAddEffect=external_define(GMFMODSimpledll,"FMODInstanceAddEffect",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceAddEffect")

//export double FMODGroupAddEffect(double group, double effect)
global.dll_FMODGroupAddEffect=external_define(GMFMODSimpledll,"FMODGroupAddEffect",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODGroupAddEffect")

//export double FMODEffectFree(double effect)
global.dll_FMODEffectFree=external_define(GMFMODSimpledll,"FMODEffectFree",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectFree")


//export double FMODSoundSetLoopCount(double sound, double count)
global.dll_FMODSoundSetLoopCount=external_define(GMFMODSimpledll,"FMODSoundSetLoopCount",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetLoopCount")

//export double FMODSoundGetLoopCount(double sound)
global.dll_FMODSoundGetLoopCount=external_define(GMFMODSimpledll,"FMODSoundGetLoopCount",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetLoopCount")

//export double FMODSoundSetLoopPoints(double sound, double start, double end)
global.dll_FMODSoundSetLoopPoints=external_define(GMFMODSimpledll,"FMODSoundSetLoopPoints",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetLoopPoints")


//export double FMODInstanceSetSpeakerMix(
//  double instance,
//  double  frontleft,
//  double  frontright,
//  double  center,
//  double  lfe,
//  double  backleft,
//  double  backright,
//  double  sideleft,
//  double  sideright)

global.dll_FMODInstanceSetSpeakerMix=external_define(GMFMODSimpledll,"FMODInstanceSetSpeakerMix",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetSpeakerMix")


//export double FMODInstanceSetLoopPoints(double instance, double start, double end)
global.dll_FMODInstanceSetLoopPoints=external_define(GMFMODSimpledll,"FMODInstanceSetLoopPoints",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetLoopPoints")

//export double FMODInstanceGetAudibility(double instance)
global.dll_FMODInstanceGetAudibility=external_define(GMFMODSimpledll,"FMODInstanceGetAudibility",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetAudibility")

//export double FMODUpdateTakeOverWhileLocked()
global.dll_FMODUpdateTakeOverWhileLocked=external_define(GMFMODSimpledll,"FMODUpdateTakeOverWhileLocked",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdateTakeOverWhileLocked")

//export double FMODUpdateTakeOverDone()
global.dll_FMODUpdateTakeOverDone=external_define(GMFMODSimpledll,"FMODUpdateTakeOverDone",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODUpdateTakeOverDone")

//export double FMODSpectrumSetSnapshotType(double snapshottype)
global.dll_FMODSpectrumSetSnapshotType=external_define(GMFMODSimpledll,"FMODSpectrumSetSnapshotType",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSpectrumSetSnapshotType")

//export double FMODInstanceGetNextTag(double instance)
global.dll_FMODInstanceGetNextTag=external_define(GMFMODSimpledll,"FMODInstanceGetNextTag",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetNextTag")

//export double FMODGetTagName(LPSTR buffer)
global.dll_FMODGetTagName=external_define(GMFMODSimpledll,"FMODGetTagName",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODGetTagName")

//export double FMODGetTagData(LPSTR buffer)
global.dll_FMODGetTagData=external_define(GMFMODSimpledll,"FMODGetTagData",dll_cdecl,ty_real,1,ty_string);
if(WTF) show_debug_message("Defined: FMODGetTagData")


//export double FMODSoundAddAsyncStream(LPCSTR soundfile, double threed)
global.dll_FMODSoundAddAsyncStream=external_define(GMFMODSimpledll,"FMODSoundAddAsyncStream",dll_cdecl,ty_real,2,ty_string,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAddAsyncStream")


//export double FMODSoundAsyncReady(double sound)
global.dll_FMODSoundAsyncReady=external_define(GMFMODSimpledll,"FMODSoundAsyncReady",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundAsyncReady")


//export double FMODInstanceAsyncOK(double instance)
global.dll_FMODInstanceAsyncOK=external_define(GMFMODSimpledll,"FMODInstanceAsyncOK",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceAsyncOK")

//export double FMODSoundGetMusicNumChannels(double sound)
global.dll_FMODSoundGetMusicNumChannels=external_define(GMFMODSimpledll,"FMODSoundGetMusicNumChannels",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMusicNumChannels")

//export double FMODSoundGetMusicChannelVolume(double sound, double channel)
global.dll_FMODSoundGetMusicChannelVolume=external_define(GMFMODSimpledll,"FMODSoundGetMusicChannelVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundGetMusicChannelVolume")


//export double FMODSoundSetMusicChannelVolume(double sound, double channel, double volume)
global.dll_FMODSoundSetMusicChannelVolume=external_define(GMFMODSimpledll,"FMODSoundSetMusicChannelVolume",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSoundSetMusicChannelVolume")


//export double FMODEffectGetActive(double effect)
global.dll_FMODEffectGetActive=external_define(GMFMODSimpledll,"FMODEffectGetActive",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetActive")

//export double FMODEffectSetActive(double effect, double v)
global.dll_FMODEffectSetActive=external_define(GMFMODSimpledll,"FMODEffectSetActive",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetActive")

//export double FMODEffectGetBypass(double effect)
global.dll_FMODEffectGetBypass=external_define(GMFMODSimpledll,"FMODEffectGetBypass",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetBypass")

//export double FMODEffectSetBypass(double effect, double v)
global.dll_FMODEffectSetBypass=external_define(GMFMODSimpledll,"FMODEffectSetBypass",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetBypass")

//export double FMODEffectGetDefaultPan(double effect)
global.dll_FMODEffectGetDefaultPan=external_define(GMFMODSimpledll,"FMODEffectGetDefaultPan",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultPan")

//export double FMODEffectSetDefaultPan(double effect, double val)
global.dll_FMODEffectSetDefaultPan=external_define(GMFMODSimpledll,"FMODEffectSetDefaultPan",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultPan")


//export double FMODEffectGetDefaultVol(double effect)
global.dll_FMODEffectGetDefaultVol=external_define(GMFMODSimpledll,"FMODEffectGetDefaultVol",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultVol")

//export double FMODEffectSetDefaultVol(double effect, double val)
global.dll_FMODEffectSetDefaultVol=external_define(GMFMODSimpledll,"FMODEffectSetDefaultVol",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultVol")


//export double FMODEffectGetDefaultFr(double effect)
global.dll_FMODEffectGetDefaultFr=external_define(GMFMODSimpledll,"FMODEffectGetDefaultFr",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetDefaultFr")

//export double FMODEffectSetDefaultFr(double effect, double val)
global.dll_FMODEffectSetDefaultFr=external_define(GMFMODSimpledll,"FMODEffectSetDefaultFr",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetDefaultFr")



//export double FMODEffectGetNumParams(double effect)
global.dll_FMODEffectGetNumParams=external_define(GMFMODSimpledll,"FMODEffectGetNumParams",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetNumParams")

//export double FMODEffectGetParamValue(double effect, double p)
global.dll_FMODEffectGetParamValue=external_define(GMFMODSimpledll,"FMODEffectGetParamValue",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamValue")

//export double FMODEffectSetParamValue(double effect, double p, double v)
global.dll_FMODEffectSetParamValue=external_define(GMFMODSimpledll,"FMODEffectSetParamValue",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetParamValue")

//export double FMODEffectGetParamMin(double effect, double p)
global.dll_FMODEffectGetParamMin=external_define(GMFMODSimpledll,"FMODEffectGetParamMin",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamMin")


//export double FMODEffectGetParamMax(double effect, double p)
global.dll_FMODEffectGetParamMax=external_define(GMFMODSimpledll,"FMODEffectGetParamMax",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetParamMax")

//export double FMODEffectGetParamValueStr(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamValueStr=external_define(GMFMODSimpledll,"FMODEffectGetParamValueStr",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamValueStr")

//export double FMODEffectGetParamName(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamName=external_define(GMFMODSimpledll,"FMODEffectGetParamName",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamName")


//export double FMODEffectGetParamLabel(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamLabel=external_define(GMFMODSimpledll,"FMODEffectGetParamLabel",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamLabel")


//export double FMODEffectGetParamDesc(double effect, double p, LPSTR str)
global.dll_FMODEffectGetParamDesc=external_define(GMFMODSimpledll,"FMODEffectGetParamDesc",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string);
if(WTF) show_debug_message("Defined: FMODEffectGetParamDesc")



//export double FMODEffectGetSpeakerActive(double effect, double speaker)
global.dll_FMODEffectGetSpeakerActive=external_define(GMFMODSimpledll,"FMODEffectGetSpeakerActive",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectGetSpeakerActive")


//export double FMODEffectSetSpeakerActive(double effect, double speaker, double active)
global.dll_FMODEffectSetSpeakerActive=external_define(GMFMODSimpledll,"FMODEffectSetSpeakerActive",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectSetSpeakerActive")

//export double FMODEffectReset(double effect)
global.dll_FMODEffectReset=external_define(GMFMODSimpledll,"FMODEffectReset",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODEffectReset")


//export double FMODInstanceGetPitch(double instance)
global.dll_FMODInstanceGetPitch=external_define(GMFMODSimpledll,"FMODInstanceGetPitch",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGetPitch")

//export double FMODInstanceSetPitch(double instance, double pitch)
global.dll_FMODInstanceSetPitch=external_define(GMFMODSimpledll,"FMODInstanceSetPitch",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSetPitch")

//export double FMODSnapShotToDsList(double startpos, double size, double ds)
global.dll_FMODSnapShotToDsList=external_define(GMFMODSimpledll,"FMODSnapShotToDsList",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODSnapShotToDsList")

//export double FMODCreateSoundFromMicInput()
global.dll_FMODCreateSoundFromMicInput=external_define(GMFMODSimpledll,"FMODCreateSoundFromMicInput",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODCreateSoundFromMicInput")

//export double FMODRecordStart(double sound)
global.dll_FMODRecordStart=external_define(GMFMODSimpledll,"FMODRecordStart",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODRecordStart")

//export double FMODRecordStop(double startpos, double size, double ds)
global.dll_FMODRecordStop=external_define(GMFMODSimpledll,"FMODRecordStop",dll_cdecl,ty_real,0);
if(WTF) show_debug_message("Defined: FMODRecordStop")


//export double FMODInstanceSet3DSpread(double instance, double spreadangle)
global.dll_FMODInstanceSet3DSpread=external_define(GMFMODSimpledll,"FMODInstanceSet3DSpread",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3DSpread")

//export double FMODInstanceGet3DSpread(double instance)
global.dll_FMODInstanceGet3DSpread=external_define(GMFMODSimpledll,"FMODInstanceGet3DSpread",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGet3DSpread")

//export double FMODInstanceSet3DPanLevel(double instance, double panlevel)
global.dll_FMODInstanceSet3DPanLevel=external_define(GMFMODSimpledll,"FMODInstanceSet3DPanLevel",dll_cdecl,ty_real,2,ty_real,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceSet3DPanLevel")

//export double FMODInstanceGet3DPanLevel(double instance)
global.dll_FMODInstanceGet3DPanLevel=external_define(GMFMODSimpledll,"FMODInstanceGet3DPanLevel",dll_cdecl,ty_real,1,ty_real);
if(WTF) show_debug_message("Defined: FMODInstanceGet3DPanLevel")


//export string FMODGetErrorString(double error_code)
global.dll_FMODGetErrorString=external_define(GMFMODSimpledll,"FMODGetErrorString",dll_cdecl,ty_string,1,ty_real);
if(WTF) show_debug_message("Defined: FMODGetErrorString")
