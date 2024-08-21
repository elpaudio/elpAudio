///(fname,DEST_FNAME)
//thanks to visual music by icuurd12b21

// *.m3u;*.m3u8;*.ram;*.axf;*.wax;*.wvx;*.wpl;*.w3c;*.b4s;*.p2p;*.kpl;*.itl;*.rdf;*.pls;

var fullname; fullname = argument0;
var filename; filename = filename_change_ext(filename_name(fullname),''); //removes .* from filename
var ext; ext = string_lower(filename_ext(fullname));
var path; path = filename_path(fullname);
var drive; drive = filename_drive(fullname);

var destfile; destfile = working_directory +"\playlists\migrate\"+filename+".epl"

if(!directory_exists(working_directory +"\playlists"))
    directory_create(working_directory +"\playlists");
if(!directory_exists(working_directory +"\playlists\migrate"))
    directory_create(working_directory +"\playlists\migrate");

var hf; hf = file_text_open_write(destfile);
if(!hf)
{
    show_message("Error opening destination playlist file:#" + destfile +"##Failed to migrate file:#"+fullname);
    return "";;
}

file_text_write_string(hf,'0') // TYPICAL PLAYLIST.

var hf2; hf2 = file_text_open_read(fullname);
if(!hf2)
{
    show_message("Error opening source play list file.  Failed to migrate file:#"+fullname);
    return "";;
}

var title,track;
var pos,pos2;
title = "<unknown>";
track = ""

var isINI{isINI = false}

while(!file_text_eof(hf2))
{
    str=HTMLTagDecode(UDecode(file_text_read_string(hf2)));
    file_text_readln(hf2);
    if(ext = ".m3u" or ext = ".ram")
    {
        if(string_char_at(str,1) = "#")
        {
            pos = 2;
            if(string_char_at(str,2) = " ")
                pos = string_pos(" ",str)+1;
            if(string_upper(string_copy(str,1,8)) = "#EXTINF:")
                pos = string_pos(",",str)+1;
            title = string_copy(str,pos,10000);
        }
        else if(string_length(str) > 3)
        {
            track = str;
            track = string_replace(track,"FILE:","")
            track = string_replace(track,"File:","")
            track = string_replace(track,"file:","")
            track = string_replace(track,"URL:","")
            track = string_replace(track,"url:","")
            track = string_replace(track,"Url:","")
            if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
            {
                track = str;
            }
            else
            {
                track = path+str;
            }

            if(title = "<unknown>")
            {
                title = filename_name(string_replace_all(track,"/","\"));
                title = filename_change_ext(title,"")
            }
            file_text_write_string(hf,track);
            file_text_writeln(hf);
            title = "<unknown>";
        }
    }
    else if(ext = ".axf" or ext = ".wax" or ext = ".wvx" )
    {

        pos = string_pos("<TITLE>",string_upper(str));
        if(pos)
        {
            pos2 = string_pos("</TITLE>",string_upper(str)) + string_pos("<TITLE/>",string_upper(str));
            if(pos2) title = string_copy(str,pos+7,pos2-pos-7)
        }
        else
        {
            pos = string_pos("<REF",string_upper(str));
            if(pos)
            {
                pos = string_pos("=",string_upper(str));
                while(string_char_at(str,pos)<>'"' and pos <1000)
                {
                    pos+=1;
                }
                pos2 = string_pos("/>",string_upper(str)) + string_pos("<TITLE/>",string_upper(str));
                while(string_char_at(str,pos2)<>'"' and pos2 >0)
                {
                    pos2-=1;
                }
                if(pos2)
                {
                    track = string_copy(str,pos+1,pos2-pos-1)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }

                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                        title = filename_change_ext(title,"")
                    }
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                    title = "<unknown>";
                }
            }
        }
    }
    else if(ext = ".wpl" or ext = ".w3c" )
    {
            pos = string_pos("<MEDIA",string_upper(str));
            if(pos)
            {
                pos = string_pos("=",string_upper(str));
                while(string_char_at(str,pos)<>'"' and pos <1000)
                {
                    pos+=1;
                }
                pos2 = pos+1;
                while(string_char_at(str,pos2)<>'"' and pos2 <1000)
                {
                    pos2+=1;
                }
                if(pos2)
                {
                    track = string_copy(str,pos+1,pos2-pos-1)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }

                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                        title = filename_change_ext(title,"")
                    }
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                    title = "<unknown>";
                }
            }
    }
    else if(ext = ".b4s")
    {

        pos = string_pos("<NAME>",string_upper(str));
        if(pos)
        {
            pos2 = string_pos("</NAME>",string_upper(str)) + string_pos("<NAME/>",string_upper(str));
            if(pos2) title = string_copy(str,pos+6,pos2-pos-6)

        }
        else
        {
            pos = string_pos("<ENTRY",string_upper(str));
            if(pos)
            {
                pos = string_pos("=",string_upper(str));
                while(string_char_at(str,pos)<>'"' and pos <1000)
                {
                    pos+=1;
                }
                pos2 = pos+1;
                while(string_char_at(str,pos2)<>'"' and pos2 <1000)
                {
                    pos2+=1;
                }
                if(pos2)
                {
                    track = string_copy(str,pos+1,pos2-pos-1)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }
                }
            }
            else if(string_pos("</ENTRY>",string_upper(str))+string_pos("<ENTRY/>",string_upper(str)) and track <> "")
            {
                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                        title = filename_change_ext(title,"")
                    }
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                    title = "<unknown>";
                    track = "";
            }
        }
    }
    else if(ext = ".p2p")
    {

        pos = string_pos("<FILENAME>",string_upper(str));
        if(pos)
        {
            pos2 = string_pos("</FILENAME>",string_upper(str)) + string_pos("<FILENAME/>",string_upper(str));
            if(pos2) title = string_copy(str,pos+10,pos2-pos-10)

        }
        else
        {
            pos = string_pos("<IDENTIFIER>",string_upper(str));
            if(pos)
            {
                while(string_char_at(str,pos)<>'>' and pos <1000)
                {
                    pos+=1;
                }
                pos2 = pos+1;
                while(string_char_at(str,pos2)<>'<' and pos2 <1000)
                {
                    pos2+=1;
                }
                if(pos2)
                {
                    track = string_copy(str,pos+1,pos2-pos-1)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }
                }
            }
            else if(string_pos("<AUDIO>",string_upper(str)) and track <>"")
            {
                if(title = "<unknown>")
                {
                    title = filename_name(string_replace_all(track,"/","\"));
                }
                title = filename_change_ext(title,"")
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                title = "<unknown>";
                track = "";
            }
        }
    }
    else if(ext = ".kpl")
    {
        if(string_char_at(str,1)=="[")
        {
            isINI = true;
        }
        if(isINI)
        {
            file_text_write_string(hf,str);
            file_text_writeln(hf);
        }
        else
        {
            pos = string_pos("AS=",string_upper(str));
            if(pos)
            {

                //&as=http://www.lisarein.com/LisaRein-ShakeAllOver.mp3
                track = string_copy(str,pos+3,1000);
                title = filename_name(string_replace_all(track,"/","\"));
                title = filename_change_ext(title,"")
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                title = "<unknown>";
                track = "";
            }
        }
    }
    else if(ext = ".itl")
    {
        pos = string_pos("<key>name</key><string>",string_lower(str))+string_pos("<key>name<key/><string>",string_lower(str));
        if(pos)
        {
            pos2 = string_pos("</STRING>",string_upper(str)) + string_pos("<STRING/>",string_upper(str));
            if(pos2) title = string_copy(str,pos+23,pos2-pos-23)

        }
        else
        {
            pos = string_pos("<key>location</key><string>",string_lower(str))+string_pos("<key>location<key/><string>",string_lower(str));
            if(pos)
            {
                pos2 = string_pos("</STRING>",string_upper(str)) + string_pos("<STRING/>",string_upper(str));
                if(pos2)
                {
                    track = string_copy(str,pos+27,pos2-pos-27)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }
                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                    }
                    title = filename_change_ext(title,"")
            file_text_write_string(hf,track);
                    title = "<unknown>";
                    track = "";
                }
            }
        }
    }
    else if(ext = ".rdf")
    {
        pos = string_pos("<dc:title>",string_lower(str));
        if(pos)
        {
            pos2 = string_pos("</dc:title>",string_lower(str)) + string_pos("<dc:title/>",string_lower(str));
            if(pos2) title = string_copy(str,pos+10,pos2-pos-10)
        }
        else
        {
            pos = string_pos('<rdf:li rdf:resource="',string_lower(str));
            if(pos)
            {
                pos2 = string_pos('"/>',string_lower(str)) + string_pos('">',string_lower(str));
                if(pos2)
                {
                    track = string_copy(str,pos+22,pos2-pos-22)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }
                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                    }
                    title = filename_change_ext(title,"")
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                    title = "<unknown>";
                    track = "";
                }
            }
            pos = string_pos('<dc:identifier>',string_lower(str));
            if(pos)
            {
                pos2 = string_pos('</dc:identifier>',string_lower(str)) + string_pos('<dc:identifier/>',string_lower(str));
                if(pos2)
                {
                    track = string_copy(str,pos+15,pos2-pos-15)
                    track = string_replace(track,"FILE:","")
                    track = string_replace(track,"File:","")
                    track = string_replace(track,"file:","")
                    track = string_replace(track,"URL:","")
                    track = string_replace(track,"url:","")
                    track = string_replace(track,"Url:","")
                    if(string_pos(":",str) or string_pos("\",str) = 1  or string_pos("/",str) = 1)
                    {
                        track = track;
                    }
                    else
                    {
                        track = path+track;
                    }

                }
            }
            else if(string_pos('</work>',string_lower(str)) + string_pos('<work/>',string_lower(str)))
                {
                   if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                        title = filename_change_ext(title,"")
                    }
            file_text_write_string(hf,track);
            file_text_writeln(hf);
                    title = "<unknown>";
                    track = "";
                }
        }
    }
    else if(ext = ".pls")
    {
        file_text_write_string(hf,str);
        file_text_writeln(hf);
    }
    else
    {
        show_message("Unsuported format:##" + fullname + "##Operation canceled." )
        file_text_close(hf2);
        file_text_close(hf);
        return "";
    }
}
file_text_close(hf2);
file_text_close(hf);

if(ext = ".pls")
{
    file_delete(working_directory+"\dummy.ini")
    file_copy(destfile, working_directory+"\dummy.ini")
    var hf; hf = file_text_open_write(destfile);
    if(!hf)
    {
        show_message("Error opening destination play list file:#" + destfile +"##Failed to migrate file:#"+fullname);
        return "";
    }
    ini_open("dummy.ini")
    var i;
    i = 1;
    repeat(ini_read_real("Playlist","NumberOfEntries",0))
    {
        title = ini_read_string("Playlist","Title"+string(i),"<unknown>")
        track = ini_read_string("Playlist","File"+string(i),"")
        if(track <>"")
        {
                    if(title = "<unknown>")
                    {
                        title = filename_name(string_replace_all(track,"/","\"));
                        title = filename_change_ext(title,"")
                    }
            file_text_write_string(hf,track);
            file_text_writeln(hf);

        }
        i+=1;
    }
    ini_close();
    file_delete(working_directory+"\dummy.ini")
    file_text_close(hf);
}
else if(ext = ".kpl" and isINI)
{
    file_delete(working_directory+"\dummy.ini")
    file_copy(destfile, working_directory+"\dummy.ini")
    var hf; hf = file_text_open_write(destfile);
    if(!hf)
    {
        show_message("Error opening destination play list file:#" + destfile +"##Failed to migrate file:#"+fullname);
        return "";;
    }
    ini_open("dummy.ini")
    var i;
    i = 1;
    do
    {
        track = ini_read_string("Entries","entry"+string(i),"")
        if(track <>"")
        {
                    title = filename_name(string_replace_all(track,"/","\"));
                    title = filename_change_ext(title,"")
            file_text_write_string(hf,track);
            file_text_writeln(hf);
        }
        i+=1;
    } until(track = "")

    ini_close();
    file_delete(working_directory+"\dummy.ini")
    file_text_close(hf);
}

return destfile;
