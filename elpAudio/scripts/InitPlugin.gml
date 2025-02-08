///(fname)

_scrBegin=''
_scrStep=''
_scrDraw=''
_scrFree=''

plugin_name='elpAudio Plugin'

var d;d=debug_mode

var f,ff,msg;
f=argument0
msg=''

debug('PLUGINS: starting to load '+f)

if file_exists(f) {
    ff=file_text_open_read(f)
    debug('PLUGINS: loaded plugin '+f)
} else {
    debug('PLUGINS: no such file - '+f)
}

do {
    msg=file_text_read_string(ff)

    if string_count('/*(*CREATE*)*/',msg)==1 or string_count('#define create',msg)==1 do { // Create script

        //plugin name ONLY IN CREATE
        if string_count('pluginname',string_lower(msg))>0 plugin_name=string_replace_all(string_replace_all(string_copy_end(msg,string_length(msg)-string_pos('=',msg)),"'",''),'"','')

        if string_count('/*',msg)+string_count('*/',msg)+string_count('#define',msg)<1 _scrBegin+=msg+' '
        file_text_readln(ff)
        msg=file_text_read_string(ff)
    } until string_count('/*(*CREATE_END*)*/',msg)==1 or string_count('#undef create',msg)==1

    if string_count('/*(*STEP*)*/',msg)==1 or string_count('#define step',msg)==1 do { // Step script
        if string_count('/*',msg)+string_count('*/',msg)+string_count('#define',msg)<1 _scrStep+=msg+' '
        file_text_readln(ff)
        msg=file_text_read_string(ff)
    } until string_count('/*(*STEP_END*)*/',msg)==1 or string_count('#undef step',msg)==1

    if string_count('/*(*DRAW*)*/',msg)==1 or string_count('#define draw',msg)==1 do { // Draw script
        if string_count('/*',msg)+string_count('*/',msg)+string_count('#define',msg)<1 _scrDraw+=msg+' '
        file_text_readln(ff)
        msg=file_text_read_string(ff)
    } until string_count('/*(*DRAW_END*)*/',msg)==1 or string_count('#undef draw',msg)==1

    if string_count('/*(*FREE*)*/',msg)==1 or string_count('#define free',msg)==1 do { // Destroy script
        if string_count('/*',msg)+string_count('*/',msg)+string_count('#define',msg)<1 _scrFree+=msg+' '
        file_text_readln(ff)
        msg=file_text_read_string(ff)
    } until string_count('/*(*FREE_END*)*/',msg)==1 or string_count('#undef free',msg)==1


    file_text_readln(ff)
} until file_text_eof(ff)
file_text_close(ff)

/// cleaning bad stuff

if string_count('execute_program',_scrBegin)>0 or string_count('execute_shell',_scrBegin)>0 or string_count('registry',_scrBegin)>0
or string_count('execute_program',_scrStep)>0 or string_count('execute_shell',_scrStep)>0 or string_count('registry',_scrStep)>0
or string_count('execute_program',_scrDraw)>0 or string_count('execute_shell',_scrDraw)>0 or string_count('registry',_scrDraw)>0
or string_count('execute_program',_scrDraw)>0 or string_count('execute_shell',_scrDraw)>0 or string_count('registry',_scrDraw)>0
show_message('elpAudio has taken malicious code down from the plugin named '+string(f)+'.')

//taking down right now, not before this ^ message :-)

_scrBegin=string_replace_all(_scrBegin,'execute_program(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'execute_program_async(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'execute_program_silent(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'execute_shell(','do_nothing(')

_scrBegin=string_replace_all(_scrBegin,'registry_read_real(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_read_dword(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_read_string(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_write_real(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_write_string(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_write_string_ext(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_write_real_ext(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_read_string_ext(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_read_real_ext(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_exists(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_exists_ext(','do_nothing(')
_scrBegin=string_replace_all(_scrBegin,'registry_set_root(','do_nothing(')

_scrStep=string_replace_all(_scrStep,'execute_program(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'execute_program_async(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'execute_program_silent(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'execute_shell(','do_nothing(')

_scrStep=string_replace_all(_scrStep,'registry_read_real(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_read_dword(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_read_string(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_write_real(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_write_string(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_write_string_ext(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_write_real_ext(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_read_string_ext(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_read_real_ext(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_exists(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_exists_ext(','do_nothing(')
_scrStep=string_replace_all(_scrStep,'registry_set_root(','do_nothing(')

_scrDraw=string_replace_all(_scrDraw,'execute_program(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'execute_program_async(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'execute_program_silent(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'execute_shell(','do_nothing(')

_scrDraw=string_replace_all(_scrDraw,'registry_read_real(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_read_dword(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_read_string(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_write_real(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_write_string(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_write_string_ext(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_write_real_ext(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_read_string_ext(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_read_real_ext(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_exists(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_exists_ext(','do_nothing(')
_scrDraw=string_replace_all(_scrDraw,'registry_set_root(','do_nothing(')

debug('PLUGINS: cleared malicious code from '+f)
