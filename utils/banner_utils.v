module utils

import os
import net
import utils

pub struct CurrentLine {
	pub mut:
		line	int
}

pub fn output_ui(mut socket net.TcpConn, username string) {
	socket.write_string("\033[2J\033[1;1H") or { 0 }
	mut banner_file := os.read_file(os.getwd() + "/banners/ui.txt") or { "" }
	mut txt_file := os.read_file(os.getwd() + "/banners/ui_text.txt") or { "" }
	mut config_file := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	_, output_position := utils.parse(config_file, "Hostname", "hostname_position")
	row := output_position.split(",")[0]
	column := output_position.split(",")[1]
	socket.write_string(utils.replace_code(banner_file.trim_space(), username)) or { 0 }

	// for g, i in banner_file.split("\n") {
	// 	if i.starts_with("place_text(") { continue }
	// 	if g == banner_file.split("\n").len-1 {
	// 		socket.write_string("${i.trim_space()}") or { 0 }
	// 	} else {
	// 		socket.write_string("${i.trim_space()}\r\n") or { 0 }
	// 	}
	// }

	for g in txt_file.split("\n") {
		if g.starts_with("place_text") {
			mut r, c := utils.get_str_between(g, "(", ")")
			utils.place_text(mut socket, r.int(), c.int(), utils.replace_code(g.split("=")[1].trim_space(), username))
		}
	}
}

pub fn get_str_between(find_str string, start string, end string) (string, string) {
	mut recording := false
	mut returning := ''
	for i in 0..(find_str.len) {
		mut c := find_str[i].ascii_str()
		if c == start {
			recording = true
		} else if c == end {
			recording = false
		} else if recording == true {
			returning += c
		}
	}
	return returning.split(",")[0], returning.split(",")[1]
}



pub fn replace_code(lul string, username string) string {
	mut g := lul
	g = g.replace("\n", "\r\n")
	g = g.replace("{RED}", "\x1b[31m")
	g = g.replace("{YELLOW}", "\x1b[33m")
	g = g.replace("{BLUE}", "\x1b[34m")
	g = g.replace("{PURPLE}", "\x1b[35m")
	g = g.replace("{GREEN}", "\x1b[32m")
	g = g.replace("{BLACK}", "\x1b[30m")
	g = g.replace("{GREY}", "\x1b[37m")
	g = g.replace("{CYAN}", "\x1b[36m")
	g = g.replace("{WHITE}", "\x1b[97m")
	g = g.replace("{RESET}", "\x1b[39m")
	g = g.replace("{USERNAME}", username)
	return g
}
