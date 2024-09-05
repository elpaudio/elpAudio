#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_blend=__butloadlistcol
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=0
myfile=get_open_filename
            ('All supported files|*.epl;*.elf;*.m3u;*.m3u8;*.ram;*.axf;*.wax;*.wvx;*.wpl;*.w3c;*.b4s;*.p2p;*.kpl;*.itl;*.rdf;*.pls;|elpAudio playlist files|*.epl;*.elf|Other playlist files|*.m3u;*.m3u8;*.ram;*.axf;*.wax;*.wvx;*.wpl;*.w3c;*.b4s;*.p2p;*.kpl;*.itl;*.rdf;*.pls;','list.epl')

if myfile!='' then
    ListLoad(myfile,1)
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
