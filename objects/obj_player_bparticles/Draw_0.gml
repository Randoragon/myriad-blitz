 /// @description Draw Player Particles
 
#region Skip if loading
 
if (global.loading == 1) { exit; }

#endregion

#region Draw player particles

if (part_system_count_lt(global.part_system[0]) > 0) {
    surface_set_target(GENERAL_SURFACE);
    gpu_set_alphatestref(0);
    if (global.shader_conditions == 0) {
        part_system_draw_lt(global.part_system[0]);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_lt(global.part_system[0]);
        shader_reset();
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion