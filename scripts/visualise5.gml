var wavel,waver,specl,specr,maxs,maxw;
maxs = __visual_freq;
maxw=256;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2;
wave=0
spec=1
specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxw);
FMODNormalizeSpectrumData(0,maxw);
FMODGetSpectrumBuffer(0,maxw);
i=0
ii=0
repeats=maxs-2
repeat(repeats)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_point_width(xx+ii+(w/maxs)*0.5,yy+h*0.5-SNAPSPECENTRY(i)*(h*0.5),(w/maxs))
i+=1
ii+=(w/maxs)*(maxs/repeats)
}
//right
i=0
ii=0
specr = FMODInstanceGetSpectrumSnapshot(argument0,1,maxs*2);
FMODNormalizeSpectrumData(1,maxs);
repeat(repeats)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_point_width(xx+ii+(w/maxs)*0.5,yy+h*0.5+SNAPSPECENTRY(i)*(h*0.5),(w/maxs))
i+=1
ii+=(w/maxw)*(maxw/repeats)
}

draw_set_color(c_white)
