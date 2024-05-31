if !variable_local_exists('__game') {
if !variable_local_exists('__coins') {
__coins=0
__lives=3
__game=1
} else {
if __coins>0 or __lives>0 or __game=0 {
__coins=0
__lives=3
__game=1
}
}
}

//.......00000.....
//....000000000....
//00000000000000000
//000.00.000.00.000
//....00.....00....


__car[0,0]=-1
__car[1,0]=-1
__car[2,0]=-1
__car[3,0]=-1
__car[4,0]=-1
__car[5,0]=-1
__car[6,0]=-1
__car[7,0]=0
__car[8,0]=0
__car[9,0]=0
__car[10,0]=0
__car[11,0]=0
__car[12,0]=-1
__car[13,0]=-1
__car[14,0]=-1
__car[15,0]=-1
__car[16,0]=-1

__car[0,1]=-1
__car[1,1]=-1
__car[2,1]=-1
__car[3,1]=-1
__car[4,1]=0
__car[5,1]=0
__car[6,1]=0
__car[7,1]=0
__car[8,1]=0
__car[9,1]=0
__car[10,1]=0
__car[11,1]=0
__car[12,1]=0
__car[13,1]=-1
__car[14,1]=-1
__car[15,1]=-1
__car[16,1]=-1

__car[0,2]=0
__car[1,2]=0
__car[2,2]=0
__car[3,2]=0
__car[4,2]=0
__car[5,2]=0
__car[6,2]=0
__car[7,2]=0
__car[8,2]=0
__car[9,2]=0
__car[10,2]=0
__car[11,2]=0
__car[12,2]=0
__car[13,2]=0
__car[14,2]=0
__car[15,2]=0
__car[16,2]=0

__car[0,3]=0
__car[1,3]=0
__car[2,3]=0
__car[3,3]=-1
__car[4,3]=0
__car[5,3]=0
__car[6,3]=-1
__car[7,3]=0
__car[8,3]=0
__car[9,3]=0
__car[10,3]=-1
__car[11,3]=0
__car[12,3]=0
__car[13,3]=-1
__car[14,3]=0
__car[15,3]=0
__car[16,3]=0


var ww,hh;
ww=0
repeat(16) {
hh=0
repeat(4) {
if __car[ww,hh]=-1 n=1 else draw_point(argument0+ww,argument1+hh)
hh+=1
}
ww+=1
}
