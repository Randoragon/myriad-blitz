/// @description Build cut1 & cut2

#region Startup code

sprite_index = spr_christmas_statboard + global.realm - 1;
cut1[image_number - 1] = -4;
cut2[image_number - 1] = -4;
mysurface = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));
surface_set_target(mysurface);
for (var i = 0; i < image_number; i++) {
	draw_clear_alpha(0, 0);
	draw_sprite_ext(sprite_index, i, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	cut1[i]=sprite_create_from_surface(mysurface, 0, 0, surface_get_width(mysurface), 110, 0, 0, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index));
	cut2[i]=sprite_create_from_surface(mysurface, 0, surface_get_height(mysurface) - 75, surface_get_width(mysurface), 50, 0, 0, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index) - surface_get_height(mysurface) + 75);
}
surface_reset_target();
surface_free(mysurface);

#endregion