#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.play {
if usemonoster {
if monosterimg>-1 and sprite_exists(monosterimg) {
draw_sprite_ext(monosterimg,1-SoundIsStereo(global.musicsound),monosterx,monostery,1,1,0,c_white,1)
}
}
}
