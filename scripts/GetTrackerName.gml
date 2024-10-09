if string_lower(filename_ext(argument0))='.xm'return string_replace_all(GetXMName(argument0),"#",'//');
if string_lower(filename_ext(argument0))='.mod'return string_replace_all(GetMODName(argument0),"#",'//');
if string_lower(filename_ext(argument0))='.s3m'return string_replace_all(GetS3MName(argument0),"#",'//');
if string_lower(filename_ext(argument0))='.it'return string_replace_all(GetITName(argument0),"#",'//');
