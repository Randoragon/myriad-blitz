/// @description Draw Charge Particles

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Draw charge particles

if (part_system_count_ult(PART_SYSTEM_CHARGE) > 0) {
    surface_set_target(GENERAL_SURFACE);
    gpu_set_alphatestref(0);
    if (global.shader_conditions == 0) {
        part_system_draw_ult(PART_SYSTEM_CHARGE);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_ult(PART_SYSTEM_CHARGE);
        shader_reset();
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion