/// @description strip_filename(fname)

// Replaces all illegal Windows characters with "_"

return string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(argument[0], "?", "_"), "/", "_"), "|", "_"), "\\", "_"), "*", "_"), ":", "_"), "<", "_"), ">", "_"), "\"", "_");