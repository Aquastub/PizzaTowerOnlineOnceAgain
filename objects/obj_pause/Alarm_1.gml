/// @description title screen
with all
	if !persistent instance_destroy(id, false);

instance_destroy(obj_hallway);
instance_destroy(obj_fadeout);

if global.jukebox == -1
	audio_stop_all();
else
	audio_resume_all();

if gototitle
{
	audio_stop_all();
	pause = false;
	instance_activate_all();
	
	instance_destroy(obj_debris);
	with obj_panicdebris
		alarm[0] = -1;
	
	room_goto(Realtitlescreen);
	
	with obj_player
	{
		petfollow = -1
		gravmult = 1
		character = "P"
		state = states.titlescreen
		targetDoor = "A"
		scr_characterspr()
	}
	
	scr_playerreset();
}
else if room == custom_lvl_room
{
	pause = false;
	instance_activate_all();
	
	scr_playerreset();
	with obj_player
	{
		targetDoor = "B";
		state = states.titlescreen;
	}
	
	if obj_onlinemenu.level_id == 0
		obj_onlinemenu.menu = menutypes.listfiles;
	else
		obj_onlinemenu.menu = menutypes.leveldetails;
	obj_onlinemenu.gmsroom = -1;
	room_goto(editor_entrance);
}
else
{
	pause = false;
	instance_activate_all();
	
	scr_playerreset();
	
	if scr_stylecheck(2)
	{
		with obj_player
		{
			targetDoor = "NONE";
			if backtohubstartx == 0 && backtohubstarty == 0
				targetDoor = "A";
			else
			{
				x = backtohubstartx;
				y = backtohubstarty;
			}
			room_goto(backtohubroom);
			
			// no need for this anymore
			backtohubstartx = 0;
			backtohubstarty = 0;
			backtohubroom = hub_room1;
		}
	}
	else
	{
		with obj_player
			targetDoor = "A";
		room_goto(hub_room1);
	}
}

// create nice fadeout
with instance_create(0, 0, obj_fadeout)
{
	fadealpha = 1;
	fadein = true;
}
