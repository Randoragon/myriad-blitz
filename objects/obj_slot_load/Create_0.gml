/// @description event_inherited
event_inherited();

///setup
image_speed=0;
image_index=0;
depth=gui_depth.slot_load;
grabbed=0;
keyboard_string="";
selection="";
selection_name="<failed to fetch name>";
page=0;
readpos=1;
slotcount=0;
slot[0]=file_find_first(working_directory+"slots\\*mbslot",0);
button[0]=-4; button[1]=-4; button[2]=-4; button[3]=-4;

if(slot[0]!="") {
    button[0]=instance_create_f(x-250,y+218,obj_button,19);
    button[1]=instance_create_f(x-196,y+218,obj_button,20);
    button[2]=instance_create_f(x-100,y+210,obj_button,17);
    button[3]=instance_create_f(x+100,y+210,obj_button,18);
    
    do {
        slotcount++;
        slot[slotcount]=file_find_next();
    }
    until(slot[slotcount]=="")
    
    var f,data;
    for(var i=0; i<slotcount; i++) {
        f=file_text_open_read(working_directory+"slots\\"+slot[i]);
        file_text_readln(f); //skip disclaimer
        slotname[i]=file_text_readbit(f);
        slotdate[i]=file_text_readbit(f);
        
        data[0]=flip_decode(file_text_readbit(f),slotdate[i]); //this loads only the first line of the file, which means it's not obvious that the info we want to fetch will be there (due to chunks), but we only want the first 4 variables, so it's physically impossible for it to be further than within the first 200 lines (min. chunk size).
        slotversion[i]=string_readln(data,";");
        slotchar[i]=-1;
        slotchar[i]=string_readln_real(data,";");
        slotpoints[i]=-1;
        slotpoints[i]=string_readln_real(data,";");
        slotrealm[i]=-1;
        slotrealm[i]=string_readln_real(data,";");
        file_text_close(f);
    }
    spawncount=7;
    alarm[0]=1;
}
