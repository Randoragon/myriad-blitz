/// @description scr_Save(slot_name);
/// @param slot_name

with (instance_create_layer(0, 0, "Transition", obj_slot_saving)) {
    slot_name = argument[0];
}