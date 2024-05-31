var time,mintime,hourtime,sectime;
time=argument0//*1000 //because of the new extension
hourtime=0
sectime=0
mintime=0
i=0
repeat(time/1000) {
sectime+=1
i+=1
if i>59 {mintime+=1 sectime=0 i=0}
}
return string_pad(mintime,2)+':'+string_pad(sectime,2)
