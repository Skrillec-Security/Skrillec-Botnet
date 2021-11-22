module utils

import os

pub struct Parse {
	pub mut:
		file			string
		parsed_data		string	
		parsed_data_arr	[]string

}

/* 
			QUICK FUNCTION TO USE WITHOUT STRUCT
____________________________________________________________________________________________________
	method =>				parse(data string, field string, key string) (int, string)
	return type =>			int, string
	return type notes =>	int is for checking if key's value was found (0 not found / 1 found)
	arguments =>	
							data | Syn string
							field | the field you want to look throught
							key | the key you want the value of
*/
pub fn parse(data string, field string, key string) (int, string) {
	if data.len == 0 { return 0,"" }
	mut lines := data.split("\n")
	mut line_count := 0
	for line in lines {
		if (line.starts_with(field) && line.ends_with("{")) || line.contains("${field} {") {
			mut found := 0
			mut find_c := line_count+1
			for {
				if lines[find_c].contains("{") { return 0, "" }
				if lines[find_c].contains(key + " =") {
					mut split_line := lines[find_c].replace("${key} ", "").replace("=", "")
					if lines[find_c].contains("//") {
						split_line = split_line.split("/")[0]
					}
					return 1, split_line.trim_space()
				}
				find_c += 1
			}
		}
		line_count += 1
	}
	return 0, ""
}

pub fn grab_all_keys(data string, field string) (int, [][]string) {
	mut keys_in_fields := [][]string

	return 0, keys_in_fields
}

pub fn trim_all_spaces(str string) string {
	if str.len == 0 { return str }
	mut trimmed := ""
	mut found := 0
	for i in 0..str.len {
		if str[i].ascii_str() != " " || str[i].ascii_str() != "\t" { trimmed += str[1].ascii_str() }
	}

	return trimmed
}