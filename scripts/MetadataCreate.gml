if !variable_global_exists('metatags') then
    global.metatags=ds_map_create()
else
    ds_map_clear(global.metatags)
