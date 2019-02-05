/// @description Draw Ultimate Particles

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Draw ultimate particles

if (part_system_count_lt(global.part_system[6]) > 0) {
    surface_set_target(GENERAL_SURFACE);
    draw_set_alpha_test_ref_value(0);
    if (global.shader_conditions == 0) {
        part_system_draw_lt(global.part_system[6]);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_lt(global.part_system[6]);
        shader_reset();
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

#endregion