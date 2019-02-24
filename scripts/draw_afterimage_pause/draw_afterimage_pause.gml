/// @description draw_afterimage_pause(frameskip);
/// @param frameskip

// Draws an instance's afterimage without updating it. 

var grid = afterimage_ds_grid;

// draw the afterimage
draw_set_alpha_test_ref_value(floor(ds_grid_get_min(grid, 1, 7, ds_grid_width(grid)-1, 7) * draw_get_alpha() * 255));
for (var i=1; i<ds_grid_width(grid); i+=argument[0]+1) {
    if (grid[# i, 7] > 0) {
        draw_sprite_ext(grid[# i, 0], grid[# i, 1], grid[# i, 2], grid[# i, 3], grid[# i, 4], grid[# i, 5], grid[# i, 6], image_blend, grid[# i, 7] * draw_get_alpha());
    }
}

draw_set_alpha_test_ref_value(254);