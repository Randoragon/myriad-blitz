/// @description part_type_blend_color_alpha_pro(part_id, blend_mode, color1, color2, alpha1, alpha2)
/// @param part_id
/// @param blend_mode
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function part_type_blend_color_alpha_pro() {

	var part = global.part_type[argument[0]];
	var a = 26;

	part[| a++] = argument[1];
	part[| a++] = argument[2];
	part[| a++] = argument[3];
	part[| a++] = argument[4];
	part[| a]   = argument[5];


}
