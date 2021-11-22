module utils

import net

pub fn change_size(mut socket net.TcpConn, r int, c int) {
	socket.write_string("\033[8;${r};${c}t") or { 0 }
}

pub fn sock_place_text(mut socket net.TcpConn, r int, c int, msg string) {
	socket.write_string("\033[${r};${c}f${msg}") or { 0 }
}