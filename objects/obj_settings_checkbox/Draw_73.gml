/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw tooltips


if(check==1) {
    draw_set_color(rgb(0,60,0));
} else {
    draw_set_color(rgb(60,0,0));
}

if(boss.x>=x+25-2 && boss.x<=x+25+(3*string_width(string_hash_to_newline(label)))+2 && boss.y>=y-(1.5*(string_height(string_hash_to_newline(label))))-2 && boss.y<=y+(1.5*(string_height(string_hash_to_newline(label))))+2 && desc!="") {
    draw_tooltip(desc);
}

///SURFACE RESET
surface_reset_target();

