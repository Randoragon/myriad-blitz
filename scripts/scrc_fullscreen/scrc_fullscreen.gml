/// @description scrc_fullscreen();
function scrc_fullscreen() {

	global.fullscreen = toggle(global.fullscreen);
	window_set_fullscreen(global.fullscreen);



}
