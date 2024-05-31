var _f;_f=global.themepath
ini_open(_f)
global.plrwidth=ini_read_real('Interface','playerW',480)
if global.plrwidth=0 global.plrwidth=display_get_width()
global.plrheight=ini_read_real('Interface','playerH',80)
if global.plrheight=0 global.plrheight=display_get_height()
ini_close()
