module server

import os
import io
import net
import time
import config
import server

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
}

pub fn (mut s Server) set_port(port string) {
	s.port = port
}

pub fn (mut s Server) connection_handler(mut socket net.TcpConn) {
	mut reader := io.new_buffered_reader(reader: socket)
	mut user_ip := socket.peer_addr() or { return }
	mut fixed_ip := "$user_ip".split("]:")[0].replace("[::ffff:", "")
	mut fixed_port := "$user_ip".split("]:")[1]
	print("New User Connected!: ${user_ip}\r\n")
	mut start_current := server.Current{}
	//Add login here then log the user's username, IP, and detect if user is using the Skrillec CLIENT to connect
	/*
		Login shit here
	*/
	socket.write_string("Username: ") or { 0 }
	mut username := reader.read_line() or { "" }
	socket.write_string("Password: ${config.Black}") or { 0 }// Black text when typing password (invisible)
	mut password := reader.read_line() or { "" }
	socket.write_string(config.Default) or { 0 } // reset color to default
	print("New User has logged in! ${username}\r\n")
	s.clients.u_name << username
	s.clients.u_sockets << socket
	s.clients.u_ip << fixed_ip
	s.clients.u_port << fixed_port.int()
	s.clients.using_client << false
	print(s)
	///////////////////////////////// Send to command handler after login! ///////////////////////////////////////////
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

pub fn (mut c Clients) get_ip(username string) string {
	for i in 0..(c.u_sockets).len {
		if c.u_name[i] == username {
			ip := c.u_sockets[i].peer_addr() or { panic("[x] Error") }
			return "$ip"
		}
	}
	return ""
}
