if !variable_global_exists('metatags') then
    global.metatags=dsmap()
else
    ds_map_clear(global.metatags)
