///() - loads plugins from `plugins\` folder
var f;f=filename_path(global.themepath)+'theme.plg'
if f!='theme.plg' and file_exists(f) {
        plg=instance_create(0,0,objPlugin)
        debug('LoadPlugins(): created instance objPlugin (id: '+string(plg)+')')
        with plg {
            InitPlugin(f)
            execute_string(_scrBegin)
            __plugin_from_theme=1
        }
    f=file_find_next()
}
