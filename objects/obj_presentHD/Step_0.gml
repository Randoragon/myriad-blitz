/// @description Opening

#region Opening

if (mouse_check_button_pressed(mb_left) && (place_meeting(x, y, boss) || open) && global.state == 2) {
	open = toggle(open);
	if (open) {
		global.busy++;
	} else {
		global.busy--;
	}
}

if (global.state == 1)  { open  = FALSE; }
if ( open && alpha < 1) { alpha += 0.02; }
if (!open && alpha > 0) { alpha -= 0.02; }

#endregion