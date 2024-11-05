///(name,[id if name=='custom'])
if argument0='default' {draw_set_font(global.__fon_cap) return string_height('A')}
if argument0='custom' and argument_count==2 {draw_set_font(argument[1]) return string_height('A')}
return 0
