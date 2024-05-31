#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if create=0 {
//execute_program(global.__progdir+'data\elpAudioList.exe','',0)
__pl_window=gmSDL_windowCreate(window_get_x(),window_get_y()+window_get_height(),pl_w,pl_h,GM_WINDOW_SHOWN,$C0C0C0)
gmSDL_windowTitleSet(__pl_window,"Playlist Manager")
_topimg=gmSDL_spriteLoad(__pl_window,pl_topimg,1)
butclose=gmSDL_spriteLoad(__pl_window,pl_butclose,3)
_bgimg=gmSDL_spriteLoad(__pl_window,pl_backimg,1)
///gmSDL_windowSetShape(__pl_window,GM_SHAPE_COLORKEY)
create=1
}
if __pl_window>=1 {
gmSDL_windowUpdate(__pl_window,room_speed)
if pl_drawtop gmSDL_spriteDraw(__pl_window,_topimg,0,pl_topx,pl_topy)

if gmSDL_drawButton(__pl_window,butclose,pl_closex,pl_closey)=1 {gmSDL_windowClose(__pl_window) show_message('READY.')}

if pl_drawback gmSDL_spriteDraw(__pl_window,_bgimg,0,pl_bgx,pl_bgy)

} else {show_error('Sorry to announce, but elpAudio is gonna close. Error is:#'+gmDLL_error()+'#Window error: 0x00000'+string(abs(__pl_window))+"##Send this screenshot to:#discord: elpoep",1) game_end()}
