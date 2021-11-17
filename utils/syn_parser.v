module utils

import os
import utils

/* 
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

pub fn store_fields_and_keys(data string, field string) (int, [][]string) {
	mut keys_found := [][]string
	if data.len == 0 { return 0, keys_found }
	mut lines := data.split("\n")
	mut line_count := 0
	for line in lines {
		println(line)
		if line.contains("\"") && line.contains("{") {
			if utils.trim_all_spaces(line).contains("\"${field}\"{") {
				mut found := 0
				mut find_c := line_count
				for {
					println(lines[find_c])
					if utils.trim_all_spaces(lines[find_c]).contains("{") || utils.trim_all_spaces(lines[find_c]).contains("}") { continue }
					if utils.trim_all_spaces(lines[find_c]) != "}" {
						mut split_line := lines[find_c].split("=")
						mut key_check := utils.trim_all_spaces(split_line[0])
						mut value_check := utils.trim_all_spaces(split_line[1]) // this is the value if it doesnt contain quotes
						if value_check.contains("\"") && value_check.ends_with("\"") {
							mut new_value := utils.get_str_between(value_check, "\"", "\"")
							keys_found << ([key_check, value_check])
						} else { 
							keys_found << ([key_check, value_check])
						}
					} else {
						return 1, keys_found
					}
					find_c += 1
				}
			}
		}
		line_count += 1
	}
	return 0, keys_found
}

pub fn (mut s Syn) trim_all_spaces(str string) string {
	if str.len == 0 { return str }
	mut trimmed := ""
	mut found := 0
	for i in 0..str.len {
		if str[i].ascii_str() != " " || str[i].ascii_str() != "\t" { trimmed += str[1].ascii_str() }
	}

	return trimmed
}