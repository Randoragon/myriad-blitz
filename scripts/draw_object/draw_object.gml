/// @description draw_object(obj)
/// @param obj
function draw_object() {

	if (instance_exists(argument[0])) {
		with (argument[0]) { draw_self(); }
	}


}
