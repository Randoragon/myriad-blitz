/// @description Update System

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Update system

if (part_system_count_ult(PART_SYSTEM_FRAG) > 0)
	part_system_update_ult(PART_SYSTEM_FRAG, global.gpspeed);

#endregion