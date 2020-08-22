/// @description ask(question, if no[scr], if yes[scr]);
/// @param question
/// @param if no[scr]
/// @param if yes[scr]
function ask() {

	play_sfx(sfx_popup, 0);

	var fobj       = instance_create_layer(CANVAS_XMID, CANVAS_YMID, "Popups", obj_popup_question);
	fobj.content   = argument[0];
	fobj.script[0] = argument[1];
	fobj.script[1] = argument[2];

	return fobj;


}
