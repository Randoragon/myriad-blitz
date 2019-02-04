/// @description skip if loading
if global.loading==1 exit;

///GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///draw self & apply shaders

if(global.shader_conditions==0) {
    draw_afterimage_remove();
    draw_self();
} else {
    shd_sprite_effect_set(global.shader_conditions);
    if(global.shader_conditions>=4 && global.shader_conditions<=7) {
        if(gpspeed!=0) {
            draw_afterimage(10,0.1,1,0,6);
        } else {
            draw_afterimage_pause(0);
        }
    }
    draw_self();
    shader_reset();
}

///SURFACE RESET
surface_reset_target();

