with other instance_destroy()
SettingsSave()
debug('GAME END: Bye!')
if variable_global_exists('eapi_trayremove') then
    external_call(global.eapi_trayremove,window_handle(),0)
FMODfree()
UnloadFMOD()
game_end()
