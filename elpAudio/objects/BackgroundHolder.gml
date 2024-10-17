#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if useimgforback {
    if sprite_exists(global.__img_back) and global.__img_back>-1
        draw_sprite_stretched_ext(global.__img_back,0,backx,backy,backw,backh,__bgcol,1)
}
