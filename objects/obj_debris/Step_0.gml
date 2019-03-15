/// @description Destroy Condition

#region Skip if loading

if (global.loading == 1)  { exit; }

#endregion

#region Inherit parent event

event_inherited();

#endregion

#region Destroy condition

image_alpha -= 0.08 * global.gpspeed;

if ((x < sprite_xoffset - sprite_width || x > CANVAS_XEND + sprite_xoffset || y < sprite_yoffset - sprite_height || y > CANVAS_YEND + sprite_yoffset)
|| (image_alpha <= 0 && (!ds_exists(afterimage_ds_grid, ds_type_grid) || ds_grid_get_max(afterimage_ds_grid, 1, 7, ds_grid_width(afterimage_ds_grid), 7) <= 0))
|| (custom_sprite == 2 && !(global.shader_conditions >= 4 && global.shader_conditions <= 7))) {
	explode(x, y, 1, -1);
	instance_destroy();
}

#endregion