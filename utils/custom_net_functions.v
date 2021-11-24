module utils

import os
import net
import utils

pub fn change_size(mut socket net.TcpConn, r int, c int) {
	socket.write_string("\033[8;${r};${c}t") or { 0 }
}

pub fn place_text(mut socket net.TcpConn, r int, c int, text string) {
	if text.contains("\n") {
		//split 
	}
	socket.write_string("\033[${r};${c}f${text}") or { 0 }
}

pub fn place_text_from_file(mut socket net.TcpConn, r int, c int, file string) {
	mut file_d := os.read_file(os.getwd() + "/banners/${file}_text.txt") or { "" }
	socket.write_string("\033[${r};${c}f${file_d}") or { 0 }
}

pub fn move_cursor(mut socket net.TcpConn, r int, c int) {
	socket.write_string("\033[${r};${c}f") or { 0 }
}