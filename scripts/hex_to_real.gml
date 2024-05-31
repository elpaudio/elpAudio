/// hex_to_str(color);
/*
ARGUMENTS
color = the color to convert to a hex string
*/

var chqscrString,chqscrHexString,chqscrRed,chqscrGreen,chqscrBlue,chqscrN;
 chqscrString= "\#"
chqscrHexString ="0123456789ABCDEF";
chqscrRed =   color_get_blue (argument0); //was red
chqscrGreen = color_get_green(argument0);
chqscrBlue =  color_get_red  (argument0); //was blue

    chqscrN = chqscrRed;
    chqscrString += string_char_at(chqscrHexString,((chqscrN-chqscrN mod 16)/16)+1)+string_char_at(chqscrHexString,(chqscrN mod 16)+1);
    chqscrN = chqscrGreen;
    chqscrString += string_char_at(chqscrHexString,((chqscrN-chqscrN mod 16)/16)+1)+string_char_at(chqscrHexString,(chqscrN mod 16)+1);
    chqscrN = chqscrBlue;
    chqscrString += string_char_at(chqscrHexString,((chqscrN-chqscrN mod 16)/16)+1)+string_char_at(chqscrHexString,(chqscrN mod 16)+1);

    //while string_starts_with(chqscrString,'\#00') chqscrString=string_delete(chqscrString,3,2)

    chqscrString=string_copy_end(chqscrString,2)//6-string_count('0',chqscrString))

return chqscrString;
