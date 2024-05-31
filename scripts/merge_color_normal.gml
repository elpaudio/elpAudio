    ///merge_color_normal(col1,col2,factor)
    //col1,col2: colors to merge
    //factor: amount
    //returns: a more accurately merged color.
    //to avoid errors lol

    var __r1,__g1,__b1,__r2,__g2,__b2;

    __r1=color_get_red  (argument0)//sqr(color_get_red  (argument0))
    __g1=color_get_green(argument0)//sqr(color_get_green(argument0))
    __b1=color_get_blue (argument0)//sqr(color_get_blue (argument0))

    __r2=color_get_red  (argument1)//sqr(color_get_red  (argument1))
    __g2=color_get_green(argument1)//sqr(color_get_green(argument1))
    __b2=color_get_blue (argument1)//sqr(color_get_blue (argument1))

    return make_color_rgb(
        lerp(__r1,__r2,argument2),//sqrt(lerp(__r1,__r2,argument2)),
        lerp(__g1,__g2,argument2),//sqrt(lerp(__g1,__g2,argument2)),
        lerp(__b1,__b2,argument2)//sqrt(lerp(__b1,__b2,argument2))
    )
