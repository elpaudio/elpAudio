if !variable_global_exists('fxmap') {
global.fxmap=ds_map_create()
}
ds_map_set(global.fxmap,'fx'+string(argument0),Effect)
