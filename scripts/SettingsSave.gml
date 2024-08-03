///()
ini_open(global.__progdir+'settings.ini')
    ini_write_real('','volume',global.volume)
    ini_write_real('','lastSong',global.current)
    ini_write_real('','lastVisualiser',__visualiser)
    ini_write_real('','ShuffleSongs',global.randomized)
ini_close()

if ds_list_size(global.list)>0
ListSave(global.__progdir+'playlists\temp.elf')
else
file_delete(global.__progdir+'playlists\temp.elf')
