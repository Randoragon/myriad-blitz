/// @description knockback(force, direction, Hacceleration, Vacceleration);
/// @param force
/// @param direction
/// @param Hacceleration
/// @param Vacceleration

var gpspd = global.gpspeed;
if (global.gpspeed == 0) {
    if (global.prev_gpspeed != 0) {
        gpspd = global.prev_gpspeed;
    } else {
        gpspd = 1;
    }
}

var kbangle = argument[1] % 360;
if (kbangle < 0) { kbangle += 360; }
var fkb = argument[0];

if (kbangle % 90) != 0 {
    var hval = fkb * cos((kbangle % 90) * pi / 180);
    var vval = fkb * sin((kbangle % 90) * pi / 180);
	if (kbangle > 0   && kbangle < 90)					{ hkb =  hval; vkb = -vval; }
	if (kbangle > 90  && kbangle < 180)					{ hkb = -vval; vkb = -hval; }
	if (kbangle > 180 && kbangle < 270)					{ hkb = -hval; vkb =  vval; }
	if (kbangle > 270 && kbangle < 360 && kbangle != 0) { hkb =  vval; vkb =  hval; }
} else {
	if (kbangle == 0)   { hkb = fkb;  vkb = 0;    }
	if (kbangle == 90)  { hkb = 0;    vkb = -fkb; }
	if (kbangle == 180) { hkb = -fkb; vkb = 0;    }
	if (kbangle == 270) { hkb = 0;    vkb = fkb;  }
}

// global.gpspeed correction
if (hkb != 0) {
    var ahkb0 = argument[2];
    var hkb0  = hkb;
    var th0   = abs(hkb0 / ahkb0);
    ahkb      = abs((hkb0 * (th0 + 1)) / (sqr(th0 / gpspd) + (th0 / gpspd)));
    hkb       = abs(ahkb * (th0 / gpspd)) * sign(hkb0);
}

if (vkb != 0) {
    var avkb0 = (argument_count >= 4 ? argument[3] : argument[2]);
    var vkb0  = vkb;
    var tv0   = abs(vkb0 / avkb0);
    avkb      = abs((vkb0 * (tv0 + 1)) / (sqr(tv0 / gpspd) + (tv0 / gpspd)));
    vkb       = abs(avkb * (tv0 / gpspd)) * sign(vkb0);
}

/*show_message(
object_get_name(object_index) + ":\n" + 
"x = " + string(x) + 
";\n y = " + string(y) + 
";\nself.dirkb = " + string(kbangle) + 
";\nother.dirkb = " + string(argument[1]) + 
";\n fkb = " + string(fkb) + 
";\n hkb = " + string(hkb) + 
";\n vkb = " + string(vkb) + ";"
);