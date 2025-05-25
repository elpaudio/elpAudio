#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pstate!=EA_NONE {
        if monosterimg>-1 and sprite_exists(monosterimg) {
            draw_sprite_ext(monosterimg,1-SoundIsStereo(global.musicsound),x,y,1,1,0,c_white,1)
        }
}
