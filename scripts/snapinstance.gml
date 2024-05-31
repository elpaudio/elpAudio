///(instance,x,y,w,h)
InitVisVars(argument1,argument2,argument3,argument4)
GetWaveBuffer(maxw,0,argument0)
SetVisColorAlpha(global.visfgcol,0.8)
repeat(maxs)
{
    draw_line(xx,yy-SNAPWAVEENTRY(i)*h,xx+w/maxs,yy-SNAPWAVEENTRY(i+1)*h)
    i+=1;
    xx+=w/maxs;
}

GetWaveBuffer(maxw,1,argument0)
SetVisColorAlpha(global.visfgcol,0.6);
repeat(maxs)
{
    draw_line(xx,yy-SNAPWAVEENTRY(i)*h,xx+w/maxs,yy-SNAPWAVEENTRY(i+1)*h)
    i+=1;
    xx+=w/maxs;
}

SetVisColorAlpha(c_white,1)
