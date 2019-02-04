/// @description skip if loading
if global.loading==1 exit;

///GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///draw self & shader implementation

var shd_conds=global.shader_conditions;
if(ds_map_exists(loot,"ultimate")) {
    shd_conds|=1;
}

if(shd_conds==0) {
    draw_afterimage_remove();
    draw_self();
} else {
    shd_sprite_effect_set(shd_conds);
    if(global.shader_conditions>=4 && global.shader_conditions<=7) {
        draw_set_alpha(image_alpha);
        if(gpspeed!=0) {
            draw_afterimage(30,0.1*image_alpha,1,0,4);
        } else {
            draw_afterimage_pause(0);
        }
        draw_set_alpha(1);
    }
    draw_self();
    shader_reset();
}

///SURFACE RESET
surface_reset_target();

