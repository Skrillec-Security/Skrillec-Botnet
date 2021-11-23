module auth

import net
import crud
import mysql

pub struct CurrentLogin{
	pub mut:
		username 	string
		password	string
		ip			string
}

pub fn login(mut sql mysql.Connection, mut socket net.TcpConn, c CurrentLogin) int {
	print("here")
	get_info := crud.get_user(mut sql, c.username)
	if get_info.len == 0 {
		socket.write_string("[x] Error, Invalid information provided!....\r\nClosing app....!\r\n") or { continue }
		exit(0)
	}

	if get_info[0] == c.username.str() && get_info[2] == c.password {
		if get_info[1] == c.ip {
			return 1
			socket.write_string("[x] Welcome ${c.username} to Skrillec NET!\r\n") or { 0 }
		} else {
			return 0
			socket.write_string("[x] Error, IP Lock does not match!....\r\n[x] Closing app....\r\n") or { continue }
			exit(0)
		}
	} else {
		return 0
		socket.write_string("[x] Error, Invalid information provided!....\r\nClosing app....!\r\n") or { continue }
		exit(0)
	}

	return 0
}