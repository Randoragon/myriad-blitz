/// @description Cleanup

#region Clear particles

if (lifespan <= 0) {
	switch(f) {
		case 0:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(2, 3), c_white);
		break;
		case 1:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(2, 3), (e == 0)? c_aqua : c_yellow);
		break;
		case 2:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(2, 3), c_red);
		break;
	}
}

#endregion


#region Destroy afterimage grid

draw_afterimage_remove();

#endregion