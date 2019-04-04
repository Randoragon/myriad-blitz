/// @description Setup

#region Setup

instance_setup(irandom(image_number - 1), 0.04);
osc			 = fx_wave(3, 4, -3, -4, 1, 30, 0, -1, 3, 4, -3, -4, 3, 45, 0, -1);
sprite_index = noone;
button[0]	 = instance_create_depth_f(x + 115, y - 170, depth - 1, obj_button, 21); with (button[0]) { show = 0; image_index = 0;}
button[1]	 = instance_create_depth_f(x - 87,  y - 170, depth - 1, obj_button, 22); with (button[1]) { customize = 0; }

scr_Stats_Update(1);

//Declaring DEFAULT listed array, MUST be in sync with scr_Stats_Update();'s variable count.
var n = 0;
/*MAX HP*/				 listed[n] = 1;
desc[n] = 
"This is your starting amount of HP"+
"\nand the maximum you can hold at a time.";
n++;
/*TOP SPEED*/			 listed[n] = 1;
desc[n] = 
"No matter how long you accelerate for,"+
"\nthis is the peak of how fast you can move.";
n++;
/*ACCELERATION*/		 listed[n] = 0;
desc[n] = 
"The higher this value is, the faster"+
"\nyou gain speed during your movement.";
n++;
/*REVERSE ACCELERATION*/ listed[n] = 0;
desc[n] = 
"The higher this value is, the faster"+
"\nyou lose speed when not moving.";
n++;
/*INVTIME*/				 listed[n] = 0;
desc[n] = 
"Each hit you take is followed by a brief"+
"\nperiod of invincibility. This value"+
"\ndeclares how long that global.state lasts.";
n++;
/*FOCUS TIME*/			 listed[n] = 0;
desc[n] = 
"The maximum capacity of your Focus Bar.";
n++;
/*BODY DMG*/			 listed[n] = 1;
desc[n] = 
"The higher this value is, the more damage"+
"\nyou will deal to an enemy on body contact.";
n++;
/*BODY DEF*/			 listed[n] = 1;
desc[n] = 
"The higher this value is, the less damage"+
"\nyou will take from an enemy on body contact.";
n++;
/*BODY PEN*/			 listed[n] = 0;
desc[n] = 
"When dealing contact damage to an enemy,"+
"\nthis much of foe's defense will be ignored.";
n++;
/*BODY KB*/				 listed[n] = 0;
desc[n] = 
"The higher this value is, the further"+
"\nan enemy will be pushed away from you"+
"\non body contact.";
n++;
/*BODY KB RES*/			 listed[n] = 0;
desc[n] = 
"When taking contact damage from an enemy,"+
"\nthis much of foe's knockback will be ignored.";
n++;
/*BULLET DMG*/			 listed[n] = 1;
desc[n] = 
"The higher this value is, the more damage"+
"\neach of your bullets will deal to an enemy.";
n++;
/*SHOOTING SPD*/		 listed[n] = 0;
desc[n] = 
"The higher this value is, the smaller"+
"\nthe interval between firing bullets will be.";
n++;
/*BULLET DPS*/			 listed[n] = 0;
desc[n] = 
"BULLET_DAMAGE * SHOOTING_SPEED"+
"\nThis value is an estimate of how much damage"+
"\nyou would do be doing to an enemy each second"+
"\nwhile hitting them with bullets continuously.";
n++;
/*BULLET DEF*/			 listed[n] = 1;
desc[n] = 
"The higher this value is, the less damage"+
"\nyou will take each time you get hit by"+
"\nan enemy bullet."
n++;
/*BULLET PEN*/			 listed[n] = 0;
desc[n] = 
"When dealing damage to an enemy with bullets,"+
"\nthis much of foe's defense will be ignored.";
n++;
/*BULLET KB*/			 listed[n] = 0;
desc[n] = 
"The higher this value is, the further"+
"\nan enemy will be pushed away from a bullet"+
"\nof yours after taking damage from it.";
n++;
/*BULLET KB RES*/		 listed[n] = 0;
desc[n] = 
"When taking bullet damage from an enemy,"+
"\nthis much of bullet knockback will be ignored.";
n++;
/*SHOOTING ACC*/		 listed[n] = 0;
desc[n] = 
"Each bullet that you shoot has a random offset"+
"\nto their angle between -45 and 45 degrees."+
"\nThat range is narrowed down by this amount."
n++;
/*FRAG COUNT*/			 listed[n] = 0;
desc[n] = 
"Each bullet of yours that hits a target"+
"\nwill create this many frags before dispersing.";
n++;
/*FRAG DMG*/			 listed[n] = 0;
desc[n] = 
"The higher this value is, the more damage"+
"\neach of your frags will deal to an enemy.";
n++;
/*FRAG PEN*/			 listed[n] = 0;
desc[n] = 
"When dealing damage to an enemy with frags,"+
"\nthis much of foe's defense will be ignored.";
n++;
/*FRAG KB*/				 listed[n] = 0;
desc[n] = 
"The higher this value is, the further"+
"\nan enemy will be pushed away from a frag"+
"\nof yours after taking damage from it.";
n++;
/*CHARGE NAME*/			 listed[n] = 0;
desc[n] = "";
n++;
/*CHARGE DESC*/			 listed[n] = 0;
desc[n] = "";
n++;
/*CHARGE DMG*/			 listed[n] = 0;
desc[n] = 
"The higher this value is, the more damage"+
"\nyour charge will deal to an enemy.";
n++;
/*CHARGE PEN*/			 listed[n] = 0;
desc[n] = 
"When dealing damage to an enemy with charge,"+
"\nthis much of foe's defense will be ignored."
n++;
/*CHARGE KB*/			 listed[n] = 0;
desc[n] = 
"The higher this value is, the further"+
"\nan enemy will be pushed away from a charge"+
"\nof your after taking damage from it.";
n++;
/*CHARGING*/			 listed[n] = 0;
desc[n] = 
"This is the amount of time required to fire off"+
"\na charge assuming it's not under a cooldown.";
n++;
/*COOLDOWN*/			 listed[n] = 0;
desc[n] = 
"This is the amount of time you have to wait for"+
"\nafter using a charge before it can be used again.";
n++;
/*ULTIMATE NAME*/		 listed[n] = 0;
desc[n] = "";
n++;
/*ULTIMATE TYPE*/		 listed[n] = 0;
desc[n] = "";
n++;
/*ULTIMATE COOLDOWN*/	 listed[n] = 0;
desc[n] = 
"This is the amount of time you have to wait for"+
"\nafter using an ultimate before it can be used again.";
n++;
/*ULTIMATE DESC*/		 listed[n] = 0;
desc[n] = "";

#endregion

#region Initial load of custom shown stats data (MUST be used directly after scr_Stats_Update(1))

if (file_exists(working_directory+"userconfig.mbdat")) {
	ini_open(working_directory+"userconfig.mbdat");

	for (var i = 0; i < elementid[array_height_2d(elementid) - 1, array_length_2d(elementid, array_height_2d(elementid) - 1) - 1] + 1; i++)
		for (var l = 0; l < array_height_2d(linecount); l++)
			for (var m = 0; m < section_length[l]; m++)
				if (elementid[l, m] == i) {
					var prev  = listed[i];
					listed[i] = ini_read_real("shown_stats", string(i), -1);
					if (listed[i] == -1) { listed[i] = prev; }
				}
	button[0].show        = ini_read_real("shown_stats", "show", 0);
	button[0].image_index = button[0].show * 2;
	ini_close();
}

scr_Stats_Update(button[0].show);

for (var i = 0; i < array_length_1d(elementid); i++) { checkbox[i] = -4; }

#endregion