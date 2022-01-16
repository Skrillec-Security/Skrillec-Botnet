module custom_fn

pub fn match_contain(str string, find string) string {
	if str.contains(find) { return str }
	return find
}

pub fn match_startswith(str string, find string) string {
	if str.starts_with(find) { return str }
	return find
}