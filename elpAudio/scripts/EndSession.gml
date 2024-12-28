with other instance_destroy()
SettingsSave()
debug('GAME END: Bye!')
if variable_global_exists('eapi_trayremove') and variable_global_exists('micon') then
    external_call(global.eapi_trayremove,global.micon,0)
FMODfree()
UnloadFMOD()
game_end()
