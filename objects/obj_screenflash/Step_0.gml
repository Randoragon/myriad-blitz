/// @description Control Alpha
switch(phase) {
    case 0:
    image_alpha=fade_alpha-(fade_alpha*fade_in/fade_in0);
    if(fade_in<=0) {phase=1; if script_exists(script) {script_execute(script);} break;}
    else {fade_in-=gpspeed;}
    break;
    case 1:
    image_alpha=fade_alpha;
    if(fade_hold<=0) {phase=2; break;}
    else {fade_hold-=gpspeed;}
    break;
    case 2:
    image_alpha=fade_alpha*fade_out/fade_out0;
    if(fade_out<=0) {instance_destroy();}
    else {fade_out-=gpspeed;}
    break;
}

