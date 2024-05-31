var wavel,waver,specl,specr,maxs,maxw;
maxs = __visual_freq//256;
maxw=256;
var i,ii,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2//+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
wave=0
spec=1
specl = FMODInstanceGetSpectrumSnapshot2(argument0,0,maxw);
FMODNormalizeSpectrumData(0,maxw);
FMODGetSpectrumBuffer(0,maxw)
i=0
ii=0
repeat(maxs)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_rectangle(xx+ii,yy,xx+ii+w/maxs,yy+SNAPSPECENTRY(i+1)*(h*0.5),0)
i+=1
ii+=w/maxs
}

specr = FMODInstanceGetSpectrumSnapshot2(argument0,1,maxw);
FMODNormalizeSpectrumData(0,maxw);
FMODGetSpectrumBuffer(0,maxw)
i=0
ii=0
repeat(maxs)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_rectangle(xx+ii,yy+h,xx+ii+w/maxs,yy+h-SNAPSPECENTRY(i+1)*(h*0.5),0)
i+=1
ii+=w/maxs
}

draw_set_color(c_white)
