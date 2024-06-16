if(!string_pos("&",argument0)) return argument0;
if(!string_pos(";",argument0)) return argument0;

var str; str = argument0;
//the 2 most commun in play lists
str = string_replace_all(str,"&apos;","'")
str = string_replace_all(str,"&amp;","&")

//The commun &#<number>;
 if(string_pos("&#", str))
 {
    var i;
    i = 0
    repeat (256)
    {
        str = string_replace_all(str,"&#" + string(i) + ";" ,chr(i) )
        i+=1;
    }
 }
//and quit now if no more
if(!string_pos("&",str)) return str;
if(!string_pos(";",str)) return str;

//or do the long one
str = string_replace_all(str,"&quot;",'"')
str = string_replace_all(str,"&lt;", "<" )
str = string_replace_all(str,"&gt;", ">" )
str = string_replace_all(str,"&nbsp;", " " )
str = string_replace_all(str,"&iexcl;","?" )

str = string_replace_all(str,"&cent;","?" )

str = string_replace_all(str,"&pound;","?" )

str = string_replace_all(str,"&curren;","?" )

str = string_replace_all(str,"&yen;","?" )

str = string_replace_all(str,"&brvbar;","?" )

str = string_replace_all(str,"&sect;","?" )

str = string_replace_all(str,"&uml;","?" )

str = string_replace_all(str,"&copy;","?" )

str = string_replace_all(str,"&ordf;","?" )

str = string_replace_all(str,"&laquo;","?" )

str = string_replace_all(str,"&not;","?" )

str = string_replace_all(str,"&not;","" )

str = string_replace_all(str,"&reg;","?" )

str = string_replace_all(str,"&macr;","?" )

str = string_replace_all(str,"&deg;","?" )

 str = string_replace_all(str,"&plusmn;","?" )

 str = string_replace_all(str,"&sup2;","?" )

 str = string_replace_all(str,"&sup3;","?" )

 str = string_replace_all(str,"&acute;","?" )

 str = string_replace_all(str,"&micro;","?" )

 str = string_replace_all(str,"&para;","?" )

 str = string_replace_all(str,"&middot;","?" )

 str = string_replace_all(str,"&cedil;","?" )

 str = string_replace_all(str,"&sup1;","?" )

 str = string_replace_all(str,"&ordm;","?" )

 str = string_replace_all(str,"&raquo;","?" )

 str = string_replace_all(str,"&frac14;","?" )

 str = string_replace_all(str,"&frac12;","?" )

 str = string_replace_all(str,"&frac34;","?" )

 str = string_replace_all(str,"&iquest;","?" )

 str = string_replace_all(str,"&Agrave;","?" )

 str = string_replace_all(str,"&Aacute;","?" )

 str = string_replace_all(str,"&Acirc;","?" )

 str = string_replace_all(str,"&Atilde;","?" )

 str = string_replace_all(str,"&Auml;","?" )

 str = string_replace_all(str,"&Aring;","?" )

 str = string_replace_all(str,"&AElig;","?" )

 str = string_replace_all(str,"&Ccedil;","?" )

 str = string_replace_all(str,"&Egrave;","?" )

 str = string_replace_all(str,"&Eacute;","?" )

 str = string_replace_all(str,"&Ecirc;","?" )

 str = string_replace_all(str,"&Euml;","?" )

 str = string_replace_all(str,"&Igrave;","?" )

 str = string_replace_all(str,"&Iacute;","?" )

 str = string_replace_all(str,"&Icirc;","?" )

 str = string_replace_all(str,"&Iuml;","?" )

 str = string_replace_all(str,"&ETH;","?" )

 str = string_replace_all(str,"&Ntilde;","?" )

 str = string_replace_all(str,"&Ograve;","?" )

 str = string_replace_all(str,"&Oacute;","?" )

 str = string_replace_all(str,"&Ocirc;","?" )

 str = string_replace_all(str,"&Otilde;","?" )

 str = string_replace_all(str,"&Ouml;","?" )

 str = string_replace_all(str,"&times;","?" )

 str = string_replace_all(str,"&Oslash;","?" )

 str = string_replace_all(str,"&Ugrave;","?" )

 str = string_replace_all(str,"&Uacute;","?" )

 str = string_replace_all(str,"&Ucirc;","?" )

 str = string_replace_all(str,"&Uuml;","?" )

 str = string_replace_all(str,"&Yacute;","?" )

 str = string_replace_all(str,"&THORN;","?" )

 str = string_replace_all(str,"&szlig;","?" )

 str = string_replace_all(str,"&agrave;","?" )

 str = string_replace_all(str,"&aacute;","?" )

 str = string_replace_all(str,"&acirc;","?" )

 str = string_replace_all(str,"&atilde;","?" )

 str = string_replace_all(str,"&auml;","?" )

 str = string_replace_all(str,"&aring;","?" )

 str = string_replace_all(str,"&aelig;","?" )

 str = string_replace_all(str,"&ccedil;","?" )

 str = string_replace_all(str,"&egrave;","?" )

 str = string_replace_all(str,"&eacute;","?" )

 str = string_replace_all(str,"&ecirc;","?" )

 str = string_replace_all(str,"&euml;","?" )

 str = string_replace_all(str,"&igrave;","?" )

 str = string_replace_all(str,"&iacute;","?" )

 str = string_replace_all(str,"&icirc;","?" )

 str = string_replace_all(str,"&iuml;","?" )

 str = string_replace_all(str,"&eth;","?" )

 str = string_replace_all(str,"&ntilde;","?" )

 str = string_replace_all(str,"&ograve;","?" )

 str = string_replace_all(str,"&oacute;","?" )

 str = string_replace_all(str,"&ocirc;","?" )

 str = string_replace_all(str,"&otilde;","?" )

 str = string_replace_all(str,"&ouml;","?" )

 str = string_replace_all(str,"&divide;","?" )

 str = string_replace_all(str,"&oslash;","?" )

 str = string_replace_all(str,"&ugrave;","?" )

 str = string_replace_all(str,"&uacute;","?" )

 str = string_replace_all(str,"&ucirc;","?" )

 str = string_replace_all(str,"&uuml;","?" )

 str = string_replace_all(str,"&yacute;","?" )

 str = string_replace_all(str,"&thorn;","?" )

 str = string_replace_all(str,"&yuml;","?" )

return str;
