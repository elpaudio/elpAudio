var mf;mf=string_lower(filename_ext(argument0))
if mf=='.xm'return string_replace_all(GetXMName(argument0),"#",'//');
if mf=='.mod'return string_replace_all(GetMODName(argument0),"#",'//');
if mf=='.s3m'return string_replace_all(GetS3MName(argument0),"#",'//');
if mf=='.it'return string_replace_all(GetITName(argument0),"#",'//');
