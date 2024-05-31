var myvar,v,s,e;
if argument1=argument2+1 or argument1=argument2 {
show_message('ERROR:#No music! Or only one song in queue.') return argument0 exit}
v=argument0;
s=argument1;
e=argument2;
myvar=irandom_range(s,e)
if myvar=v {while myvar=v myvar=irandom_range(s,e)}
return floor(myvar)
