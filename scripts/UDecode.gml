var c,cat,str,len,i,endstr,c2,c3;
c2 = chr($c2);
c3 = chr($c3);
if(!string_pos(c2,argument0))
if(!string_pos(c3,argument0))
    return argument0;

str = argument0;
len = string_length(str);
i = 1;
endstr = ""
repeat(len)
{
    cat = string_char_at(str,i);
    if(cat = c2 and i<len)
    {
        c = string_char_at(str,i+1);
        if(ord(c)>=$80 and ord(c)<=$bf)
        {
            endstr += chr(ord(c));
            i+=1;
        }
        else
            endstr += cat;
    }
    else if(cat = c3 and i<len)
    {
        c = string_char_at(str,i+1);
        if(ord(c)>=$80 and ord(c)<=$bf)
        {
            endstr += chr($C0-$80+ord(c));
            i+=1;
        }
        else
            endstr += cat;
    }
    else
        endstr += cat;

    i+=1;

}

return endstr;
