elpAudio Plugins

elpoep @2018-2024

1. Introduction
2. How to make
3. Functions

1. Introduction

========================================

elpAudio plugins were introduced to give people support for external files, like .dll and others.

Plugins are starting to work on elpAudio start, working every frame until the end of session.


2. How to make

========================================

Structure:

/*(*CREATE*)*/ - Script that should start to work when elpAudio starts (one frame). 
      ^
CLOSE | THIS WITH /*(*CREATE_END*)*/ OR YOU WILL START AN ENDLESS LOOP THAT WILL BREAK ELPAUDIO!!!


/*(*STEP*)*/ - Script that works every frame.
      ^
CLOSE | THIS WITH /*(*STEP_END*)*/ OR YOU WILL START AN ENDLESS LOOP THAT WILL BREAK ELPAUDIO!!!



/*(*DRAW*)*/ - Script that works every frame,
      ^          but the big difference from STEP script is that the DRAW script can draw.
      |
CLOSE | THIS WITH /*(*DRAW_END*)*/ OR YOU WILL START AN ENDLESS LOOP THAT WILL BREAK ELPAUDIO!!!

and others.

You can reuse them, but it's better to just declare vars or do stuff in only one /*(*EVENT*)*/.

Comments:

You can write comments before /*(*CREATE*)*/, /*(*STEP*)*/ or /*(*DRAW*)*/. 
Like here:
	
	My comment that will not be compiled with my plugin aoaoaoaooaoaeoaoeaofofoadkfosifjaogijasfiguba
	/*(*CREATE*)*)
	something=0;
	/*(*CREATE_END*)*)
	the script above did nothing. the step script will die
	/*(*STEP*)*/
	debug("HALLO! :D")
	/*(*STEP_END*)*/

elpAudio will NOT compile those comments, but more comments will increase time of elpAudio loading. 

Like JavaShit (JavaScript), the code will take less to compile if there will be no spaces or newlines.

So, if you're making testing plugin example with comments and stuff, 
your plugin will compile on ~2 seconds more, because your plugin has 82357+ lines of comments (the number is random) 

BUT, if you're making mega cool plugin and wanna make it more faster to load, you can make this:

	/*(*CREATE*)*/
	b=ButtonCreate();ButtonAddCode(b,"step","if mouse_check_button_released(mb_any) and point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height) show_message('Hello world')");ButtonAddCode(b,"create","sprite_index=sprite_add(filename_path(global.themepath)+'button.png',2,0,0,0,0) image_speed=0 image_index=0");ButtonAddCode(b,"draw","draw_self()");ButtonPull(b);
	/*(*CREATE_END*)*/

The script above is a modified script that creates a button, that shows "Hello world" on press.
The script was checked for work. It was compiled for ~0.8 seconds, neither if you whitespace more (~0.9 seconds)

How it works? Simple. elpAudio read EVERY line of plugin, and checks if there are any /*(*EVENT*)*/ opener or exiter.
The more you have comments or whitespaces, the more elpAudio should read, so, try to make you plugin less whitespaced. =-)


3. Functions

======================================

With the plugins, you can use every function you want! 
But elpAudio will filter it, to avoid viruses, hacking and other bad things.

The simple script that shows hello world:

	/*(*CREATE*)*/
	/* test plugin by elpoep - creates "Hello world" message box */
	text='Hello, world!';
	show_message(text)
	/*(*CREATE_END*)*/

The simple script that creates a button, which shows "Hello world" on press



/*(*CREATE*)*/

b=ButtonCreate(); /*creates button handler*/

ButtonAddCode(b,"step","if mouse_check_button_released(mb_any) and point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height) show_message('Hello world')");
/* code above adds a step event to the button handler, that checks if button was pressed */

ButtonAddCode(b,"create","sprite_index=sprite_add(filename_path(global.themepath)+'button.png',2,0,0,0,0) image_speed=0 image_index=0");
/* code above adds a create event, sets a button's sprite to "button.png" from the theme folder (for example) */

ButtonAddCode(b,"draw","draw_self()");
/* code abovs makes a button draw itself every frame */

ButtonPull(b);
/* creates button's instance */

/*(*CREATE_END*)*/