/// @description Cleanup

#region Burst disperse particles

if (lifespan <= 0) {
	switch(f) {
		case PLAYER_EVILFLAME:
			if (e != 2) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_orange);
			} else {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), rgb(82, 0, 255));
			}
		break;
		case PLAYER_EMERALD:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), global.color[global.chrsel]);
		break;
		case PLAYER_DER_SCOOTOMIK:
			if (e == 0 || e == 2) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_yellow);
			} else if (e == 1 || e == 3) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_red);
			}
		break;
		case PLAYER_BOBILEUSZ:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_white);
		break;
	}
}

#endregion

#region Free Resources

if (f == PLAYER_BOBILEUSZ && (e == 0 || e == 2)) {
	surface_page_release("projectile", surface_overlay);
}
draw_afterimage_remove();

#endregion