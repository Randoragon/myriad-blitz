/// @description Gameplay Bars

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Draw gameplay bars

if (state == 1 && !status_effect[8]) {
    surface_set_target(GUI_SURFACE);
    var self_or_helper = self;
    draw_set_alpha_test_ref_value(0);
    repeat(1 + instance_exists(helper)) {
        with(self_or_helper) {
            //HP bar
            if (obj_player.bar_opacity[0] > 0) {
                obj_player.bar_yoffset[0] = home(obj_player.bar_yoffset[0], 36 + (((obj_player.bar_opacity[1] > 0) + (obj_player.bar_opacity[2] > 0)) * 8), 0.5);
                draw_set_alpha(min(obj_player.bar_opacity[0] / 2, 0.5));
                draw_set_color(c_black);
                draw_rectangle(x - 30, y - obj_player.bar_yoffset[0] - 6, x + 30, y - obj_player.bar_yoffset[0], 0);
                draw_set_alpha(obj_player.bar_opacity[0]);
                if (obj_player.hpmark < obj_player.hp) {
                    draw_set_color(c_red);
                    draw_rectangle(x - 29, y - obj_player.bar_yoffset[0] - 5, x - 29 + (59 * obj_player.hpmark / obj_player.hpmax), y - obj_player.bar_yoffset[0], 0);
                    if (obj_player.hpmark != obj_player.hp) {
                        draw_set_color(c_lime);
                        draw_rectangle(x - 29 + (59 * obj_player.hp / obj_player.hpmax), y - obj_player.bar_yoffset[0] - 5, x - 29 + (59 * obj_player.hpmark / obj_player.hpmax), y - obj_player.bar_yoffset[0], 0);
                    }
                } else {
                    draw_set_color(c_red);
                    draw_rectangle(x - 29, y - obj_player.bar_yoffset[0] - 5, x - 29 + (59 * obj_player.hp / obj_player.hpmax), y - obj_player.bar_yoffset[0], 0);
                    if (obj_player.hpmark != obj_player.hp) {
                        draw_set_color(c_yellow);
                        draw_rectangle(x - 29 + (59 * obj_player.hp / obj_player.hpmax), y - obj_player.bar_yoffset[0] - 5, x - 29 + (59 * obj_player.hpmark / obj_player.hpmax), y - obj_player.bar_yoffset[0], 0);
                    }
                }
                draw_set_color(c_black);
                draw_rectangle(x - 30, y - obj_player.bar_yoffset[0] - 6, x + 30, y - obj_player.bar_yoffset[0], 1);
                draw_set_alpha(1);
                if (gpspeed != 0) {
                    obj_player.bar_opacity[0] -= 0.05;
                }
            }
            //Focus Bar
            if (obj_player.bar_opacity[1] > 0) {
                obj_player.bar_yoffset[1] = home(obj_player.bar_yoffset[1], 36 + ((obj_player.bar_opacity[2] > 0) * 8), 0.5);
                draw_set_alpha(min(obj_player.bar_opacity[1] / 2, 0.5));
                draw_set_color(c_black);
                draw_rectangle(x - 30, y - obj_player.bar_yoffset[1] - 6, x + 30, y - obj_player.bar_yoffset[1], 0);
                draw_set_alpha(obj_player.bar_opacity[1]);
                draw_set_color(c_white);
                if(obj_player.focus > 0) {
                    draw_rectangle(x - 29, y - obj_player.bar_yoffset[1] - 5, x - 29 + (59 * obj_player.focus / obj_player.foctime), y - obj_player.bar_yoffset[1], 0);
                }
                draw_set_color(c_black);
                draw_rectangle(x - 30, y - obj_player.bar_yoffset[1] - 6, x + 30, y - obj_player.bar_yoffset[1], 1);
                draw_set_alpha(1);
                if (gpspeed != 0) {
                    obj_player.bar_opacity[1] -= 0.05;
                }
            }
            //Charging & CCooldown Bars
            if (obj_player.bar_opacity[2] > 0) {
                obj_player.bar_yoffset[2] = 36;
                if (obj_player.charge > 0) {
                    //Charging Bar
                    draw_set_alpha(min(obj_player.bar_opacity[2] / 2, 0.5));
                    draw_set_color(c_black);
                    draw_rectangle(x - 30, y - obj_player.bar_yoffset[2] - 6, x + 30, y - obj_player.bar_yoffset[2], 0);
                    draw_set_alpha(obj_player.bar_opacity[2]);
                    draw_set_color(global.color[boss.chrsel]);
                    draw_rectangle(x - 29, y - obj_player.bar_yoffset[2] - 5, x - 29 + ((59 * obj_player.charge) / (obj_player.ctime)), y - obj_player.bar_yoffset[2], 0);
                    draw_set_color(c_black);
                    draw_rectangle(x - 30, y - obj_player.bar_yoffset[2] - 6, x + 30, y - obj_player.bar_yoffset[2], 1);
                    draw_set_alpha(1);
                } else {
                    //CCooldown Bar
                    draw_set_alpha(min(obj_player.bar_opacity[2] / 2, 0.5));
                    draw_set_color(c_black);
                    draw_rectangle(x - 30, y - obj_player.bar_yoffset[2] - 6, x + 30, y - obj_player.bar_yoffset[2], 0);
                    draw_set_alpha(obj_player.bar_opacity[2]);
                    draw_set_color(color_shift_hsv(global.color[boss.chrsel], 128, 0, 0, 1));
                    draw_rectangle(x - 29, y - obj_player.bar_yoffset[2] - 5, x - 29 + ((59 * obj_player.discharge) / obj_player.ccooldown), y - obj_player.bar_yoffset[2], 0);
                    draw_set_color(c_black);
                    draw_rectangle(x - 30, y - obj_player.bar_yoffset[2] - 6, x + 30, y - obj_player.bar_yoffset[2], 1);
                    draw_set_alpha(1);
                }
                if (gpspeed != 0) {
                    obj_player.bar_opacity[2] -= 0.05;
                }
            }
        }
        self_or_helper = helper;
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

#endregion