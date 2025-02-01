///()
var mysec;mysec='General'
ini_open(global.__progdir+'settings.ini')
    ini_write_real(mysec,'volume',global.volume)
    ini_write_real(mysec,'lastSong',global.current)
    ini_write_real(mysec,'lastVisualiser',__visualiser)
    ini_write_real(mysec,'ShuffleSongs',global.randomized)
ini_close()

if ds_list_size(global.list)>0
    ListSave(global.__progdir+'playlists\temp.epl')
else
    file_delete(global.__progdir+'playlists\temp.epl')
