var l,mydrive,i,mydir;
l=argument0
mydrive=ord("C")
i=0
repeat(23) {
    mydir=chr(mydrive+i)+string_copy(l,2,256)

    if file_exists(mydir) then
        return mydir

    i+=1;
}
return ''
