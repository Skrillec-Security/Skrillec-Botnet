module auth

import net
import time
import auth
import crud
import mysql
import config
import crypto.sha1

pub struct CurrentLogin{
	pub mut:
		username 	string
		password	string
		ip			string
}

pub fn login(mut sql mysql.Connection, mut socket net.TcpConn, c CurrentLogin) int {
	get_info := crud.get_user(mut sql, c.username)
	
	if get_info.len == 0 {
		socket.write_string("${config.Red}[x] Error, Invalid information provided!....\r\nClosing app....!${config.Default}\r\n") or { 0 }
		time.sleep(4 * time.second)
		socket.close() or { return 0 }
		return 0
	}

	if get_info[0] == c.username.str().replace("\r\n", "") && get_info[2] == sha1.hexhash(c.password.replace("\r\n", "")) {
		if get_info[1] == c.ip || c.ip == "none" || c.username.str().replace("\r\n", "") == "root" {
			socket.write_string("${config.Green}[x] Welcome ${c.username} to Skrillec NET!${config.Green}\r\n") or { 0 }
			return 1
		} else {
			socket.write_string("${config.Red}[x] Error, IP Lock does not match!....\r\n[x] Closing app....${config.Default}\r\n") or { 0 }
			time.sleep(4 * time.second)
			socket.close() or { return 0 }
			return 0
		}
	} else {
		socket.write_string("${config.Red}[x] Error, Invalid information provided!....\r\nClosing app....!${config.Default}\r\n") or { 0 }
		time.sleep(4 * time.second)
		socket.close() or { return 0 }
		return 0
	}
	return 0
}

pub fn lol() {

}