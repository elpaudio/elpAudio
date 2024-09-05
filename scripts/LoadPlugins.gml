///() - loads plugins from `plugins\` folder
var ff;ff='plugins\active.ini'

if !file_exists(ff) {

var fff;fff=file_text_open_write(ff)
file_text_write_string(fff,'[Plugins]')
file_text_close(fff)

ini_open(ff)
var f;f=file_find_first('plugins\*.plg',fa_hidden)
if f!='' do {
ini_write_string('Plugins',f,'1')
f=file_find_next()
} until f=''

file_find_close()
ini_close()
}

if !file_exists(ff) {debug('LoadPlugins() error: no '+ff+' found') exit}
ini_open(ff)
var f;f=file_find_first('plugins\*.plg',fa_hidden)

if f!='' {
    do {
        if ini_read_real('Plugins',f,1)==1 {
            plg=instance_create(0,0,objPlugin)
            debug('LoadPlugins(): created instance objPlugin (id: '+string(plg)+')')
            with plg {
                InitPlugin('plugins\'+f)
                execute_string(_scrBegin)
                }
        }
        f=file_find_next()
    } until f=''
}

file_find_close()
ini_close()
