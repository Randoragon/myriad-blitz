/// @description toggle(var, val1, val2...)
/// @param var
/// @param val1
/// @param val2...

// If no vals, toggles var true-false. If a few arguments, it cycles through the values from left to right.

var output = argument[0];

if (argument_count >= 3) {
	for (var i = 1; i <= argument_count - 1; i++) {
		if (output == argument[i]) {
			if (argumentnumber < argument_count - 1) {
				output = argument[i + 1];
			} else {
				output = argument[1];
			}
		}
	}
} else if (argument_count == 1) {
	if (output == 0) {
		output = 1;
	} else {
		output = 0;
	}
}

argument[0] = output;
return argument[0];

