///(raw_time): real
//taken from renex engine with some fixes for elpAudio
var mintime,sectime;
sectime=(argument0 div 1000)
mintime=(sectime div 60)
return string_pad(mintime div 60,2)+":"+string_pad(mintime mod 60,2)+':'+string_pad(sectime mod 60,2)
