InitVisVars(argument1,argument2,argument3,argument4)
GetSpecBuffer(maxw,0,argument0);
repeat(maxs)
{
SetVisColorAlpha(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)),1);
draw_rectangle(xx+ii,yy,xx+ii+w/maxs,yy+SNAPSPECENTRY(i+1)*h,0);
i+=1;
ii+=w/maxs;}

SetVisColorAlpha(c_white,1)
