/// @description scrt_restart();
function scrt_restart() {

	wipe(obj_sound_bar);
	scr_Restart();
	global.transition = 1;
	play_music(mus_rlm_christmas + global.realm - 1, 1);
	global.state = 1;
	global.points = 0;
	
	if (global.chrsel == PLAYER_BOBILEUSZ) {
		player_status_add(STATUS_EFFECT_GEAR5, -2, 0);
	}
	
	randomize();


}
