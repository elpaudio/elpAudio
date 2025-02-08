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
            global.playing=FMODSoundPlay(global.musicsound,0)
            debug('playing STREAM SONG!')
            global.stopped=0
            global.paused=0
            global.play=1
            global.songlength=0
            global.pos=0
        }
        if global.playing and !FMODInstanceAsyncOK(global.playing) {
            FMODInstanceSetMuted(global.playing,1)
            debug('Something stopped playing streaming song. MUTING!')
        }
        else {
            FMODInstanceSetMuted(global.playing,0)
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
if !global.play ResetFloatText()
enter=0
if ds_list_empty(global.list) exit
if !global.playing MusicPlay(GetListEntryRaw(global.current))
if global.paused or global.stopped {MusicResume() exit}
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global._focused exit
image_index=0
