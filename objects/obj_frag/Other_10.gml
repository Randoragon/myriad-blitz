/// @description Startup Code

#region Startup code

fmin      = spawn.fmin;
fmax      = spawn.fmax;
fdmg      = spawn.fdmg;
fpen      = spawn.fpen;
fkb       = spawn.fkb;
enemyharm = 0;

switch(f) {
	case PLAYER_EVILFLAME:
	    switch(e) {
		    case 0:
			    sprite_index = spr_evilflame_frag;
				image_speed  = 0;
			    hspeed1      = choose(1, -1) * random(4);
			    vspeed1      = random_range(-1, -3);
			    if (global.gpspeed != 0) {
			        vacc = 0.25 / global.gpspeed;
			    } else {
			        if (global.prev_gpspeed != 0) {
			            vacc = 0.25 / global.prev_gpspeed;
			        } else {
			            vacc  = 0.25;
			        }
			    }
			    lifespan = 180;
		    break;
		    case 1: // evilflame charge ring frags
			    sprite_index = spr_evilflame_frag;
				image_speed  = 0;
			    fdmg         = 10;
			    speed1       = 5;
			    lifespan     = 300;
		    break;
		    case 2: // evilflame twilight fury frags
			    sprite_index = part_star;
				image_speed  = 0;
			    image_alpha  = 0.8;
			    speed1       = 5;
			    lifespan     = 300;
				image_scale(0.3, 0.3);
		    break;
	    }
	break;
	case PLAYER_EMERALD:
	    sprite_index = spr_emerald_frag;
		image_speed  = 0;
	    speed1       = 8;
	    if (instance_exists(obj_emerald_ultimate)) {
			lifespan = irandom_range(110, 130);
			speed1  /= 2;
		} else {
			lifespan = 1200;
		}
	break;
	case PLAYER_DER_SCOOTOMIK:
	    switch(e) {
	    case 0:
		    sprite_index = spr_scootomik_frag;
			image_speed  = 0;
		    image_index  = 0;
		    image_angle  = direction;
		    speed1       = 20;
		    lifespan     = 120;
	    break;
	    case 1: //scootomik 2nd bullet red frags
		    sprite_index = spr_scootomik_frag;
			image_speed  = 0;
		    image_index  = 1;
		    image_angle  = direction;
		    speed1       = 20;
		    lifespan     = 120;
	    break;
	    case 2: //scootomik charge front frags
		    sprite_index = spr_scootomik_charge;
			image_speed  = 0;
		    image_index  = 0;
		    direction    = spawn.image_angle;
		    image_angle  = direction;
		    speed1       = 20;
		    enemyharm    = 1;
		    fdmg         = spawn.cdmg;
		    fkb          = spawn.ckb;
		    lifespan     = 120;
	    break;
	    case 3: //scootomik charge back frags
		    sprite_index = spr_scootomik_charge;
			image_speed  = 0;
		    image_index  = 1;
		    direction    = (spawn.image_angle + 180) % 360;
		    image_angle  = direction;
		    speed1       = 20;
		    enemyharm    =  1;
		    fdmg         = spawn.cdmg;
		    fkb          = spawn.ckb;
		    lifespan     = 120;
	    break;
	    }
	break;
	case PLAYER_BOBILEUSZ:
		if (e == 0) {
		    sprite_index = spr_bobileusz_frag;
			image_speed  = 0;
		    speed1       = spawn.pspd * 0.6;
		    lifespan	 = 120;
			image_blend  = hsv(irandom(255), 255, 255);
			fadeout      = 10;
			suf1		    = surface_page_index("projectile", 0); // see scr_SurfaceMapUpdate
			surface_overlay = surface_page_capture("projectile", 250);
		} else if (e == 1) {
			sprite_index = spr_bobileusz_icicle;
			image_angle  = direction;
			image_speed  = 0;
			image_index  = irandom(3);
		    speed1       = 10;
		    lifespan	 = 120;
		} else if (e == 2) {
		    sprite_index = spr_bobileusz_frag;
			image_speed  = 0;
		    speed1       = spawn.pspd * 1.4;
		    lifespan	 = 80;
			var gear	 = 5;
			for (var i = STATUS_EFFECT_GEAR1; i < STATUS_EFFECT_GEAR10 + 1; i++) {
				if (obj_player.status_effect[i]) {
					gear = i - STATUS_EFFECT_GEAR1 + 1;
					break;
				}
			}
			var dirmin	 = direction - (gear * 2);
			var dirmax	 = direction + (gear * 2);
			direction	 = random_range(dirmin, dirmax);
			var hue		 = (dirmax - direction) / (dirmax - dirmin) * 255;
			image_blend  = hsv(hue, 255, 255);
			fadeout      = 10;
			suf1		    = surface_page_index("projectile", 0); // see scr_SurfaceMapUpdate
			surface_overlay = surface_page_capture("projectile", 250);
		}
	break;
}

// Remember fadeout's initial value for potential later calculations
fadeoutmax = fadeout;

#endregion