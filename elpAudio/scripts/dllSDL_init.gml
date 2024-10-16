/*************************************************************

                        gmSDL
                    build of 05.14.2024

                    by elpoep

                    SDL support for GameMaker.

**************************************************************/

var _calltype;_calltype=dll_cdecl;
globalvar _sdl_dll;_sdl_dll='gmSDL.dll';

/* WINDOW DEFINE */
globalvar GM_WINDOW_FULLSCREEN,GM_WINDOW_SHOWN,
GM_WINDOW_NOBORDERS,GM_WINDOW_RESIZABLE,
GM_WINDOW_MINIMIZED,GM_WINDOW_MAXIMIZED,
GM_WINDOW_ONTOP,GM_WINDOW_HIDEINTASKBAR,
GM_SHAPE_DEFAULT,GM_SHAPE_BINARIZE_ALPHA,GM_SHAPE_REVERSE_BINARIZE_ALPHA,GM_SHAPE_COLORKEY
;

GM_WINDOW_FULLSCREEN=       1
GM_WINDOW_SHOWN=            4
GM_WINDOW_NOBORDERS=        16
GM_WINDOW_RESIZABLE=        32
GM_WINDOW_MINIMIZED=        64
GM_WINDOW_MAXIMIZED=        128
GM_WINDOW_ONTOP=            32768
GM_WINDOW_HIDEINTASKBAR=    65536

GM_SHAPE_DEFAULT=0
GM_SHAPE_BINARIZE_ALPHA=1
GM_SHAPE_REVERSE_BINARIZE_ALPHA=2
GM_SHAPE_COLORKEY=3
/* WINDOW DEFINE END */

var wtf;wtf=0
//init functions
if wtf show_message('1')
global._sdl_init=               external_define(_sdl_dll,'gmSDL_init',_calltype,ty_real,3,ty_real,ty_real,ty_real)
if wtf show_message('2')
global._sdl_mus_load=           external_define(_sdl_dll,'gmSDL_loadMUS',                  _calltype,ty_real,1,ty_string)
if wtf show_message('3')
global._sdl_mus_play=           external_define(_sdl_dll,'gmSDL_playMUS',                  _calltype,ty_real,1,ty_real)
if wtf show_message('4')
global._sdl_close=              external_define(_sdl_dll,'gmSDL_close',                 _calltype,ty_real,0)

if wtf show_message('5')
global._sdl_error=              external_define(_sdl_dll,'gmSDL_error',_calltype,ty_string,0)
//global._sdl_errorget=              external_define(_sdl_dll,'gmSDL_errorGet',_calltype,ty_real,0)

//window functions
if wtf show_message('6')
global._sdl_wincreate=          external_define(_sdl_dll,'gmSDL_window_create',         _calltype,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real)
if wtf show_message('7')
global._sdl_wintitle=           external_define(_sdl_dll,'gmSDL_window_title_set',          _calltype,ty_real,2,ty_real,ty_string)
if wtf show_message('8')
global._sdl_wintitleget=        external_define(_sdl_dll,'gmSDL_window_title_get',      _calltype,ty_string,1,ty_real)
if wtf show_message('9')
global._sdl_winclose=           external_define(_sdl_dll,'gmSDL_window_close',          _calltype,ty_real,1,ty_real)
//global._sdl_winborderset=       external_define(_sdl_dll,'gmSDL_window_borders_set',    _calltype,ty_real,2,ty_real,ty_real)
//global._sdl_winborderget=       external_define(_sdl_dll,'gmSDL_window_borders_get',    _calltype,ty_real,1,ty_real)
if wtf show_message('10')
global._sdl_winupdate=          external_define(_sdl_dll,'gmSDL_window_update',         _calltype,ty_real,2,ty_real,ty_real)

if wtf show_message('11')
global._sdl_win_get_x=external_define(_sdl_dll,'gmSDL_window_get_x',_calltype,ty_real,1,ty_real)
if wtf show_message('12')
global._sdl_win_get_y=external_define(_sdl_dll,'gmSDL_window_get_y',_calltype,ty_real,1,ty_real)
if wtf show_message('13')
global._sdl_win_set_pos=external_define(_sdl_dll,'gmSDL_window_set_pos',_calltype,ty_real,3,ty_real,ty_real,ty_real)

//if wtf show_message('13.1')
//global._sdl_win_shape_set=external_define(_sdl_dll,'gmSDL_window_shape_set',_calltype,ty_real,2,ty_real,ty_real)

//global._sdl_win_get_bsize=external_define(_sdl_dll,'gmSDL_window_get_bordersize',_calltype,ty_real,1,ty_real)

//sprites and drawing
if wtf show_message('14')
global._sdl_sprload=            external_define(_sdl_dll,'gmSDL_sprite_load',           _calltype,ty_real,3,ty_real,ty_string,ty_real)
if wtf show_message('15')
global._sdl_sprdraw=            external_define(_sdl_dll,'gmSDL_draw_sprite',           _calltype,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real)
if wtf show_message('16')
global._sdl_sprgetnum=            external_define(_sdl_dll,'gmSDL_sprite_get_num',           _calltype,ty_real,1,ty_real)

if wtf show_message('17')
global._sdl_sprgetw=            external_define(_sdl_dll,'gmSDL_sprite_get_width',           _calltype,ty_real,1,ty_real)
if wtf show_message('18')
global._sdl_sprgeth=            external_define(_sdl_dll,'gmSDL_sprite_get_height',           _calltype,ty_real,1,ty_real)

if wtf show_message('19')
global._sdl_buttondraw=external_define(_sdl_dll,'gmSDL_draw_button',_calltype,ty_real,4,ty_real,ty_real,ty_real,ty_real)
if wtf show_message('20')
global._sdl_rectdraw=external_define(_sdl_dll,'gmSDL_draw_rectangle',_calltype,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real)



//mouse/keyboard states
if wtf show_message('21')
global._sdl_mousegetx=external_define(_sdl_dll,'gmSDL_mouse_get_x',_calltype,ty_real,0)
if wtf show_message('22')
global._sdl_mousegety=external_define(_sdl_dll,'gmSDL_mouse_get_y',_calltype,ty_real,0)
