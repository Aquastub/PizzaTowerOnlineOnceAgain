// anti cheat
if global.saveslot == "" && !instance_exists(obj_gms) && room != characterselect
	global.saveslot = "1";

if onlinemode != global.onlinemode && !debug
{
	onlinemode = global.onlinemode;
	if room != Realtitlescreen && room != characterselect
		room_goto(room_of_dog);
}

// hub outside barrier
if !global.timeattack && global.modifier == -1
{
	if instance_exists(tabarrier)
		instance_deactivate_object(tabarrier);
}
else
{
	instance_activate_object(tabarrier);
	if instance_exists(tabarrier)
	{
		with obj_player while place_meeting(x, y, other.tabarrier)
			x++;
	}
}

// modifier shit
if global.modifier == mods.no_toppings
	global.failedmod = (global.toppings > 0);
else
	toppingsprite = -1;

if global.modifier == -1
	global.failedmod = false;

// switch fullscreen
if global.option_fullscreen && !window_get_fullscreen()
{
	switch global.option_resolution
	{
		case 0: window_set_size( 480, 270 ); break;
		case 1: window_set_size( 960, 540 ); break;
		case 2: window_set_size( 1920, 1080 ); break;
	}
}
global.option_fullscreen = window_get_fullscreen();

/*
if secretpasscodeinput != sugaryspire && room != room_of_dog
	room_goto(room_of_dog);

// unlock sugary spire
if !sugaryspire && room == Realtitlescreen && keyboard_lastchar != "" && !secretpasscodeinput
{
	secretpasscode += keyboard_lastchar;
	keyboard_lastchar = "";
	
	if !string_startswith("theresafuckingcretininthespire", secretpasscode)
		secretpasscode = "";
	
	if secretpasscode == "theresafuckingcretininthespire"
	{
		sugaryspire = true;
		secretpasscodeinput = true;
		
		ini_open("saveData.ini");
		ini_write_real("online", "shove10poundsofsugarupmyspire", true);
		ini_close();
		
		audio_stop_all();
		scr_soundeffect(sfx_toppinjingleSP);
		
		with all
			if id != other.id instance_destroy();
		room_goto(rm_blank);
	}
}
*/

