///string_time_format(format,rawtime,[[hour],[minute],[day]],[[year],[month],[day]])
//formats is:
//	"YY.MM.DD","MM.DD","YYYY:MM:DD","DD.MM.YYYY", "MM.DD.YY", "MM.DD.YYYY" 
//	"HH:MM:SS","H:M:S","MM:SS","M:S"
//if args==2 then returns rawtime (current_time)

var args;args=argument_count;
var time,mintime,hourtime,sectime,ret;

if args==5 or args==2 {
time=argument0
hourtime=0
sectime=0
mintime=0
i=0
repeat(time/1000) {
sectime+=1
i+=1
if i>59 {mintime+=1 sectime=0 i=0}
if mintime>59 {hourtime+=1 mintime=0}
}
if args==2 ret=string_pad(hourtime,2)+":"+string_pad(mintime,2)+':'+string_pad(sectime,2)
if args==5 ret=string_pad(string_replace(argument2,'H',string(hourtime)),string_count('H',argument2))+string_pad(string_replace(argument3,'M',string(mintime)),string_count('M',argument3))+string_pad(string_replace(argument4,'S',string(sectime)),string_count('S',argument4))
return ret
}

