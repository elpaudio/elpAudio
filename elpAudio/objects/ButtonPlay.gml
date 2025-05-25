#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=0
image_speed=0

sprite_index=global.__ico_play

isweb=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PLAY FROM THE WEB!!!!!!!!!
if isweb and variable_global_exists('musicsound') {
    if global.musicsound {
        if FMODSoundAsyncReady(global.musicsound) {
            global.trackhandle=FMODSoundPlay(global.musicsound,0)
            debug('playing STREAM SONG!')
            global.pstate=EA_PLAYING
            global.songlength=0
            global.pos=0
        }
        if global.trackhandle and !FMODInstanceAsyncOK(global.trackhandle) {
            FMODInstanceSetMuted(global.trackhandle,1)
            debug('Something stopped playing streaming song. MUTING!')
        }
        else {
            FMODInstanceSetMuted(global.trackhandle,0)
            debug('STREAM Playback is back to normal!')
        }
    }
}
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=0
enter=0
if ds_list_empty(global.list) {ButtonAddFile.alarm[2]=1 MusicPlay(GetListEntryRaw(global.current)) exit}
if global.pstate=EA_NONE {ResetFloatText() MusicPlay(GetListEntryRaw(global.current))}
if global.pstate!=EA_PLAYING {MusicResume() exit}
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=0
