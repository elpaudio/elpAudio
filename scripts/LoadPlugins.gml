///() - loads plugins from `plugins\` folder
var f;f=file_find_first('plugins\*.plg',fa_hidden)
if f!='' {
do {
plg=instance_create(0,0,objPlugin)
debug('LoadPlugins(): created instance objPlugin (id: '+string(plg)+')')
with plg {InitPlugin('plugins\'+f) execute_string(_scrBegin)}
f=file_find_next()
} until f=''
}
file_find_close()
