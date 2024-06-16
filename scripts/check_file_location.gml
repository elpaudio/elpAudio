var l{l=argument0}
var mydrive;mydrive=ord("C")
var i;i=0 repeat(23) {
var mydir;mydir=chr(mydrive+i)+string_copy(l,2,256)
if file_exists(mydir) return 1
i+=1;
}
return 0
