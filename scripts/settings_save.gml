ini_open(global.__progdir+'settings.ini')
//ini_write_string('','themePath',global.themepath)
//ini_write_real('','textSpeed',__speed)
ini_write_real('','volume',global.volume)
ini_write_real('','lastSong',global.current)
ini_write_real('','lastVisualiser',__visualiser)
//ini_write_real('','visualiserBars',__visual_freq)
//ini_write_string('','lastSong',global.thesong)
ini_close()
if ds_list_size(global.list)>0 savelist(global.__progdir+'temp.elf')
else file_delete(global.__progdir+'temp.elf')
