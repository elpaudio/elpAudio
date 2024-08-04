with other instance_destroy()
with newmain SettingsSave()
debug('GAME END: Bye!')
game_end()

if variable_global_exists('__sdl_init') gmSDL_close()
FMODfree()
UnloadFMOD()
