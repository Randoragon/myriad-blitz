/// @description functionality

if(busy==0 or (f==17 or f==18 or f==19 or f==20)) {
    
    //all time stuff
    switch(f) {
    case 5: image_xscale=2-(2*boss.transition); x=xstart-(50*boss.transition); if(boss.transition==1 && state==1) {instance_destroy();} break;
    case 6: image_xscale=2-(2*boss.transition); x=xstart+(50*boss.transition); if(boss.transition==1 && state==1) {instance_destroy();} break;
    case 7: x=xstart-(boss.transition*40); break;
    case 8: y=ystart-((1-boss.transition)*40); image_index=(2*(gpspeed>0))+((mouse_check_button(mb_left) or keyboard_check(vk_escape)) && grabbed=1); break;
    case 9:case 10:case 11:case 12: if(gpspeed!=0) {instance_destroy();} break;
    case 17: if(obj_slot_load.start_busy!=busy) {exit}; if(obj_slot_load.page==0) {image_blend=c_gray;} else {image_blend=rgb(255,150,100);} break;
    case 18: if(obj_slot_load.start_busy!=busy) {exit;} if(obj_slot_load.page==ceil((array_length_1d(obj_slot_load.slot)-1)/6)-1) {image_blend=c_gray;} else {image_blend=rgb(255,150,100);} break;
    case 19:case 20: if(obj_slot_load.start_busy!=busy) {exit;} if(obj_slot_load.selection=="") {image_index=2;} else {image_index=grabbed;} break;
    case 21: if(sprite_index!=noone) {image_blend=color_shift_hsv(c_orange,10*show,0,40*show,1);} if(instance_exists(obj_statboard)) {x=obj_statboard.x+115; y=obj_statboard.y-170;} break;
    case 22: if(sprite_index!=noone) {image_blend=color_shift_hsv(c_orange,10*customize,0,40*customize,1);} if(instance_exists(obj_statboard)) {x=obj_statboard.x-87; y=obj_statboard.y-170;} break;
    case 24: image_index=0+(3*(global.save_chunk_size==200)); break;
    case 25: image_index=1+(3*(global.save_chunk_size==500)); break;
    case 26: image_index=2+(3*(global.save_chunk_size==1500)); break;
    }
    
    //mouse hover
    if(place_meeting(x,y,boss) && image_alpha==1) {
        switch(f) {
        case 0:case 1:case 2:case 3:case 4: image_index=0; image_xscale=home(image_xscale,1.1,0.04,0); break;
        case 5:case 17:case 18: image_index=0; break;
        case 6: image_index=2; break;
        case 7: image_index=0; if(grabbed!=1) {image_blend=c_ltgray;} else {image_blend=c_white;} break;
        case 8: if(grabbed!=1) {image_blend=c_ltgray;} else {image_blend=c_white;} break;
        case 9:case 10:case 11:case 12:case 15: image_index=0; break;
        case 13:case 14:case 16:case 27: image_scale(home(image_xscale,1.1,0.04,0),image_xscale); break;
        case 23: image_index=1+check; image_scale(home(image_xscale,1,0.08,0),image_xscale); break;
        }
    } else {
    //idle state (not hovering)
        switch(f) {
        case 0:case 1:case 2:case 3:case 4: image_index=0; image_xscale=home(image_xscale,1,0.08,0); break;
        case 5:case 9:case 10:case 11:case 12:case 15:case 17:case 18: image_index=0; break;
        case 6: image_index=2; break;
        case 7: image_blend=c_white; image_index=0; break;
        case 8: image_blend=c_white; break;
        case 13:case 14:case 16:case 27: image_scale(home(image_xscale,1,0.04,0),image_xscale); image_blend=c_white; break;
        case 23: image_index=2*check; break;
        case 21: image_index=grabbed+(2*show); image_scale(home(image_xscale,1,0.08,0),image_xscale); break;
        }
    }
    
    //mouse press
    if(place_meeting(x,y,boss) && mouse_check_button_pressed(mb_left) && image_alpha==1 && !instance_exists(obj_Transition)) {
        switch(f) {
        case 5:
            //previous character
            if(state==0) {
            grabbed=1;
            image_index=1;
            play_sfx(sfx_button1,0,0);
            boss.chrsel--;
            if(boss.chrsel<0) {
                boss.chrsel=boss.chrcount-1;
            }
            scr_PlayerDataUpdate(boss.chrsel);
            scr_PlayerGetData();
            scr_ParticlesUpdate();
            scr_LoreUpdate();
            scr_Stats_Update(obj_statboard.button[0].show);
            }
        break;
        case 6:
            //next character
            if(state==0) {
                grabbed=1;
                image_index=3;
                play_sfx(sfx_button1,0,0);
                boss.chrsel++;
                if(boss.chrsel>boss.chrcount-1) {
                    boss.chrsel=0;
                }
                scr_PlayerDataUpdate(boss.chrsel);
                scr_PlayerGetData();
                scr_ParticlesUpdate();
                scr_LoreUpdate();
                scr_Stats_Update(obj_statboard.button[0].show);
            }
        break;
        case 8: if(state==1 && boss.transition==1) {grabbed=1; if(global.gpspeed_state!=0) {scr_Pause();} else {play_sfx(sfx_pause,0,0); global.gpspeed_state=1; wipe(obj_sound_bar); audio_resume_all();}} break;
        case 21: play_sfx(sfx_button1,0,0); show=toggle(show); scr_toggle_stats_selection(0); scr_Stats_Update(show); ini_open(working_directory+"userconfig.mbdat"); ini_write_real("shown_stats","show",show); ini_close(); grabbed=1; break;
        case 22: play_sfx(sfx_button1,0,0); scr_toggle_stats_selection(toggle(customize)); if(customize==0 && obj_statboard.button[0].show==0) scr_Stats_Update(0); grabbed=1; break;
        case 23: check=toggle(check); grabbed=1; break;
        case 24: play_sfx(sfx_button1,0,0); global.save_chunk_size=200; break;
        case 25: play_sfx(sfx_button1,0,0); global.save_chunk_size=500; break;
        case 26: play_sfx(sfx_button1,0,0); global.save_chunk_size=1500; break;
        default: grabbed=1; break;
        }
    }
    
    //mouse hold
    if(grabbed==1 && mouse_check_button(mb_left) && image_alpha==1) {
        switch(f) {
        case 0:case 1:case 2:case 3:case 4:case 5:case 7: image_index=1; break;
        case 6: image_index=3; break;
        case 9:case 10:case 11:case 12:case 15: image_index=1; break;
        case 17:case 18: if(image_blend!=c_gray) {image_index=1;} break;
        case 21: image_index=1+(2*show); break;
        case 22: image_index=1+(2*customize); break;
        case 23: image_index=2*check; image_scale(home(image_xscale,0.9,0.08,0),image_xscale); break;
        case 13:case 14:case 16:case 27: image_blend=c_ltgray; image_scale(home(image_xscale,0.9,0.08,0),image_xscale); grabbed=1; break;
        }
    }
    
    //mouse release
    if(grabbed==1 && mouse_check_button_released(mb_left) && image_alpha==1 && !instance_exists(obj_Transition)) {
        grabbed=0;
        if(place_meeting(x,y,boss)) {
            switch(f) {
            case 0: screen_transition(rm_Realms,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_button2,0,0); break;
            case 1: screen_transition(rm_Help,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_button2,0,0); break;
            case 2: display_message("Lore isn't available yet.#Maybe in the next update... Or not. We'll see.#Sorry for the inconvenience!#Randoragon",scrm_do_nothing); break;
            case 3: screen_transition(rm_Settings,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_button2,0,0); break;
            case 4: ask("Quit the game?",scrq_do_nothing,scrq_exit); break;
            case 7: if(room==rm_Main) {if(state==0) {scr_toggle_stats_selection(0); screen_transition(rm_Realms,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_back,0,0); play_music(mus_menu_intro,sound_priority.music,0); boss.menu_intro=1;}} else {screen_transition(rm_Menu,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_back,0,0);} break;
            case 9: if(global.gpspeed_state==0) {global.gpspeed_state=1; wipe(obj_sound_bar); play_sfx(sfx_pause,0,0); audio_resume_all();} break;
            case 10: ask("Do you want to restart?#Any unsaved progress will be lost.",scrq_do_nothing,scrq_restart) break;
            case 11: instance_create_f(x,y,obj_slot_name,0); play_sfx(sfx_button3,0,0); break;
            case 12: ask("Do you want to quit?#Any unsaved progress will be lost.",scrq_do_nothing,scrq_pause_back); break;
            case 13: image_blend=c_white; screen_transition(rm_About,-1,30,choose(-1,1,-2,2),c_black); play_sfx(sfx_button4,0,0); break;
            case 14: image_blend=c_white; url_open_ext("https://discord.gg/YqJYzMS","_blank"); play_sfx(sfx_button3,0,0); break;
            case 15: instance_create(lerp(CANVAS_X,CANVAS_XEND,0.5),lerp(CANVAS_Y,CANVAS_YEND,0.5),obj_slot_load); play_sfx(sfx_button3,0,0); break;
            case 16: image_blend=c_white; url_open_ext("https://www.waterflamemusic.com/","_blank"); play_sfx(sfx_button3,0,0); break;
            case 17: if(image_blend!=c_gray) {obj_slot_load.page=home(obj_slot_load.page,0,1,0); with(obj_slot) {phase=2;} obj_slot_load.spawncount=0; obj_slot_load.alarm[1]=1; play_sfx(sfx_button1,0,0);} break;
            case 18: if(image_blend!=c_gray) {obj_slot_load.page=home(obj_slot_load.page,ceil((array_length_1d(obj_slot_load.slot)-1)/6)-1,1,0); with(obj_slot) {phase=2;} obj_slot_load.spawncount=7; obj_slot_load.alarm[0]=1; play_sfx(sfx_button1,0,0);} break;
            case 19: instance_create_f(lerp(CANVAS_X,CANVAS_XEND,0.5),lerp(CANVAS_Y,CANVAS_YEND,0.5),obj_slot_name,1); play_sfx(sfx_button3,0,0); break;
            case 20: ask("Delete slot#\""+obj_slot_load.selection_name+"\"?#This change will be permanent.",scrq_do_nothing,scrq_delete_slot); break;
            case 21: image_index=2*show; break;
            case 22: image_index=2*customize; break;
            case 23: if(check==1) {image_index=2;} else {image_index=place_meeting(x,y,boss);} break;
            case 27: image_blend=c_white; url_open_ext("https://www.gamejolt.com/@RandoragonGameDev","_blank"); play_sfx(sfx_button3,0,0); break;
            }
        }
    }
    
    //keyboard actions
    if(image_alpha==1) {
        switch(f) {
        case 5:
            //previous character
            if(keyboard_check_pressed(global.keybind[1]) && state==0 && room==rm_Main) {
                play_sfx(sfx_button1,0,0);
                boss.chrsel--;
                if(boss.chrsel<0) {
                    boss.chrsel=boss.chrcount-1;
                }
                scr_PlayerDataUpdate(boss.chrsel);
                scr_PlayerGetData();
                scr_ParticlesUpdate();
                scr_LoreUpdate();
                scr_Stats_Update(obj_statboard.button[0].show);
            }
            if(keyboard_check(global.keybind[1])) {image_index=1;}
        break;
        case 6:
            //next character
            if(keyboard_check_pressed(global.keybind[3]) && state==0 && room==rm_Main) {
                play_sfx(sfx_button1,0,0);
                boss.chrsel++;
                if(boss.chrsel>boss.chrcount-1) {
                    boss.chrsel=0;
                }
                scr_PlayerDataUpdate(boss.chrsel);
                scr_PlayerGetData();
                scr_ParticlesUpdate();
                scr_LoreUpdate();
                scr_Stats_Update(obj_statboard.button[0].show);
            }
            if(keyboard_check(global.keybind[3])) {image_index=3;}
        break;
        case 7:
            //back button
            if(room!=rm_Menu && state==0 && keyboard_check_pressed(vk_escape) && !instance_exists(obj_Transition)) {
                if(room==rm_Main) {
                    if(state==0) {
                        scr_toggle_stats_selection(0);
                        screen_transition(rm_Realms,-1,30,choose(-1,1,-2,2),c_black);
                        play_sfx(sfx_back,0,0);
                        play_music(mus_menu_intro,sound_priority.music,0);
                        boss.menu_intro=1;
                    }
                } else {
                    screen_transition(rm_Menu,-1,30,choose(-1,1,-2,2),c_black);
                    play_sfx(sfx_back,0,0);
                }
            }
        break;
        case 8:
            //pause button
            if(os_is_paused() && gpspeed!=0 && state==1 && boss.transition==1) {
                scr_Pause();
            }
            if(state==1 && keyboard_check_pressed(vk_escape) && boss.transition==1) {
                if(global.gpspeed_state!=0) {
                    scr_Pause();
                } else {
                    play_sfx(sfx_pause,0,0);
                    global.gpspeed_state=1;
                    wipe(obj_sound_bar)
                    audio_resume_all();
                }
            }
        break;
        }
        
        if(((keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)) or (place_meeting(mousepos(0,-1),mousepos(1,-1),obj_player) && mouse_check_button_pressed(mb_left))) && state==0 && room==rm_Main) {
            scr_toggle_stats_selection(0);
            play_sfx(sfx_run_start,0,0);
            play_music(mus_rlm_christmas+realm-1,sound_priority.music,1);
            state=1; global.points=0;
            randomize();
            mouse_clear(mb_left);
            mouse_clear(mb_right);
            keyboard_clear(vk_space);
            keyboard_clear(vk_shift);
            keyboard_clear(ord("W"));
            keyboard_clear(ord("A"));
            keyboard_clear(ord("S"));
            keyboard_clear(ord("D"));
        }
    }
}

