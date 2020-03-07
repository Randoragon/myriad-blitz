/// @description Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Inherit parent event

event_inherited();

#endregion

#region Enemy Behavior

if (global.gpspeed != 0) {
    //INTRO
    if (intro == 1 && (x > CANVAS_XEND - 10 - (0.5 * sprite_width) || y > CANVAS_YEND - (sprite_height * 0.5) - 10 || y < CANVAS_Y + 10 + (0.5 * sprite_height))) {
        x -= 0.75 * global.gpspeed;
        if (y > CANVAS_YEND - (sprite_height * 0.5) - 10 - 1) {
            y = max(CANVAS_YEND - (sprite_height * 0.5) - 10 - 1, y - 0.75);
        }
        if (y < CANVAS_Y + 10 + (0.5 * sprite_height) + 1) {
            y = min(CANVAS_Y + 10 + (0.5 * sprite_height) + 1, y + 0.75);
        }
        if (!(x > CANVAS_XEND - 10 - (0.5 * sprite_width) || y > CANVAS_YEND - (sprite_height * 0.5) - 10 || y < CANVAS_Y + 10 + (0.5 * sprite_height))) {
            intro = 0;
			if (beh == 0) { hspeed1 = irandom_range(-2, -6); }
        }
    }
    
    //STANDARD BEHAVIOR
    if (intro == 0 && beh > 0 && !instance_exists(obj_emerald_ultimate)) {
		/*  STATES
		 *	0  - choose movement or evasion
		 *  1  - free flight (attack monitoring)
		 *  2  - attack 1 (hover in place and get ready)
		 *  3  - attack 2 (shoot out)
		 *  4  - attack 3 (stop, start pulling back)
		 *  5  - attack 4 (free flight)
		 */
		var chargespd = 15;
		 
		switch (state) {
			case 0: // choose movement or evasion
				if (abs(y - obj_player.y) < 40 && x > obj_player.x + 50 && irandom(x - obj_player.x) < 400) {
					cooldown = 20;
					state = 2;
				} else {
					if (irandom(10) < 5) {
						var xx, yy;
						xx = irandom_range(CANVAS_X + 512, CANVAS_XEND - 10 - (0.5 * sprite_width));
						yy = irandom_range(CANVAS_Y + 10 + (0.5 * sprite_height), CANVAS_YEND - (sprite_height * 0.5) - 10);
						cooldown = irandom_range(50, 110);
						fly_towards(x, y, xx, yy, cooldown);
					} else {
						var playerx, playery, playerxv, playeryv, chargespd, mvtime;
						playerx   = obj_player.x;
						playery   = obj_player.y;
						playerxv  = (obj_player.xv != 0)? global.spd : 0;
						playeryv  = (obj_player.yv != 0)? global.spd : 0;
						mvtime    = irandom_range(45, 60); // 0.75 - 1 seconds
					
						var playerx1, playery1; // player coordinates after mvtime
						playerx1 = playerx + (playerxv * mvtime);
						playery1 = playery + (playeryv * mvtime);
					
						xx = clamp(playerx1 + (mvtime * chargespd), CANVAS_X + 512, CANVAS_XEND - 10 - (0.5 * sprite_width));
						yy = clamp(playery1, CANVAS_Y + 10 + (0.5 * sprite_height), CANVAS_YEND - (sprite_height * 0.5) - 10);
						cooldown = mvtime - 20;
						
						fly_towards(x, y, xx, yy, cooldown);
					}
					state = 1;
				}
			break;
			case 1: // free flight
				cooldown = max(cooldown - global.gpspeed, 0);
				if (cooldown == 0) {
					speed1 = 0;
					if (abs(y - obj_player.y) < 20 && x > obj_player.x + 50 && irandom(x - obj_player.x) < 400) {
						cooldown = 20;
						state = 2;
					} else {
						state = 0;
					}
				}
			break;
			case 2: // attack 1
				sprite_index = spr_crow_hover;
				image_index  = 0;
				cooldown = max(cooldown - global.gpspeed, 0);
				state = (cooldown == 0)? 3 : 2;
			break;
			case 3: // attack 2
				sprite_index = spr_crow_attack;
				prev_bd = bdef;
				bdef = 0xffffff;
				hspeed1 = -chargespd;
				cooldown = floor((x - 100) / chargespd);
				state = 4;
			break;
			case 4: // attack 3
				cooldown = max(cooldown - global.gpspeed, 0);
				if (cooldown == 0) {
					sprite_index = spr_crow_hover;
					bdef = prev_bd;
					image_index = 0;
					hspeed1 = 0;
					cooldown = 40;
					state = 5;
				}
			break;
			case 5: // attack 4
				cooldown = max(cooldown - global.gpspeed, 0);
				if (cooldown == 0) {
					prev_bd = bdmg;
					bdmg = 1;
					var xx, yy;
					xx = irandom_range(CANVAS_X + 512, CANVAS_XEND - 10 - (0.5 * sprite_width));
					yy = clamp((y > obj_player.y)? irandom_range(y + 50, y + 300) : irandom_range(y - 300, y - 50), CANVAS_Y + 10 + (0.5 * sprite_height), CANVAS_YEND - (sprite_height * 0.5) - 10);
					cooldown = ceil(xx) / 5;
					fly_towards(x, y, xx, yy, cooldown);
					state = 6;
				}
			break;
			case 6:
				cooldown = max(cooldown - global.gpspeed, 0);
				if (cooldown == 0) {
					speed1 = 0;
					bdmg = prev_bd;
					sprite_index = spr_crow;
					state = 0;
				}
			break;
		}
    } else if (instance_exists(obj_emerald_ultimate) && global.gpspeed != 0) {
		// getting sucked in by emerald's current crush
        var prev_dir = direction;
        speed1       = home(speed1, 10, 0.4 * global.gpspeed, 0);
        direction    = home(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y), speed1 * 2 * global.gpspeed, 1);
        image_angle += clamp(direction - prev_dir, -5 * global.gpspeed, 5 * global.gpspeed);
        if (hspeed1 != 0) {
            hspeed1 = home(hspeed1, 0, 0.05 * global.gpspeed, 0);
        }
        if (vspeed1 != 0) {
            vspeed1 = home(vspeed1, 0, 0.05 * global.gpspeed, 0);
        }
    }
}
   
#endregion

#region Ultimate loot particles

if (ds_map_exists(loot, "ultimate")) {
    if (real_step()) {
        part_type_spawn_lt(PART_SYSTEM_ENEMY, PART_TYPE_E_ULTIMATE_LOOT, 5, x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, "ellipse", "linear", 1);
    }
}

#endregion

#region Bar extension

if (!global.enemy_details_selection_auto_aim && place_meeting(x, y, boss)) {
	global.enemy_details_selection = id;
}

bar_extension = home(bar_extension, (global.enemy_details_selection == id), 0.2, 0);

#endregion

#region Death

//classic death
if (hp <= 0) {
	if (!IS_STATUS_EFFECT_CHIP_TUNING) {
		intro = 2;
	} else {
		image_alpha -= 0.4 * global.gpspeed;
		if (image_alpha <= 0) { instance_destroy(); }
	}
}

if (global.gpspeed != 0 && intro == 2 && image_alpha > 0) || global.state == 2 {
	image_alpha = 0;
	explode(x, y, image_xscale, 1);
	if (global.state != 2) {
		event_perform(ev_other, ev_user1);
		if (ds_map_exists(loot, "ultimate")) {
			repeat (loot[? "ultimate"]) {
				instance_create(x, y, obj_ultimate_pickup);
				obj_player.ultcount++;
				obj_player.ultblink = 45;
			}
		}
	}
	instance_destroy();
}

// touchable switch
if (x <= -sprite_width + sprite_xoffset)			{ touchable = FALSE; }
if (x >= -sprite_width + sprite_xoffset)			{ touchable = TRUE; }
if (IS_STATUS_EFFECT_CHIP_TUNING && image_alpha < 1)   { touchable = FALSE; }

// out of room boundaries kill
if (x < (-2 * sprite_width) + sprite_xoffset && !IS_STATUS_EFFECT_CHIP_TUNING) { instance_destroy(); }

#endregion