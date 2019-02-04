/// @description skip if loading
if global.loading==1 exit;

///emerald - current crush

if gpspeed!=0 {
//startup resize
if scale_stage==0
{if scale_v<0.4*gpspeed scale_v+=0.05*sqr(gpspeed); else scale_stage=1;}
else if scale_stage==1
{scale_v-=0.1*sqr(gpspeed); if image_xscale<=1*gpspeed {scale_v=0; image_scale(1,1); scale_stage=2;}}
if scale_stage!=2 image_scale(image_xscale+scale_v,image_yscale+scale_v);

image_angle+=rot*gpspeed;

//spawning flow tiles
spawn_clock-=gpspeed;
if spawn_clock<=0 {
with(instance_create(x,y,obj_emerald_ultimate_flow)) image_angle=(other.image_angle*.25/5)+(65*other.rot_cycle)+irandom_range(-15,15);
spawn_clock=irandom_range(10,30);
rot_cycle=++rot_cycle%128;
}
if spawn_clock%3==0 instance_create(x,y,obj_emerald_ultimate_force);

//despawn
lifespan-=gpspeed;
if lifespan<=0 {
//particle burst
part_type_edit_lt(global.player_part[0],"angle",0,360,choose(-1,1)*4,0,1);
part_type_spawn_lt(global.part_system[6],global.player_part[0],0,x-20,y-20,x+20,y+20,"ellipse","invgaussian",100);
with(obj_emerald_ultimate_flow) scale_stage=3;

player_status_add(6,obj_player.ucooldown,0);
player_status_add(0,900,1);
player_status_add(1,900,1);
player_status_add(4,300,1);
screenflash_set(0,0,60,-1,c_white,0.75);
fx_shockwave(x,y,sqrt(sqr(CANVAS_WIDTH)+sqr(CANVAS_HEIGHT)),5,60,c_white,depth,0.8);
audio_stop_sound(sfx_emerald_ultimate_loop);
if instance_exists(obj_enemy) with(obj_enemy) {hp=0;}
instance_destroy();
}
}

///event_inherited()
event_inherited();

