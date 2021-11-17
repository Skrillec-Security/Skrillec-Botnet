module server

import os
import net
import server

pub struct Clients{
	pub mut:
		user_count		int
		users			[]string
		sockets			[]net.TcpConn
		using_client	[]bool

}

pub struct Server{
	pub mut:
		port 			string
		cnc_key 		string
}


pub fn (mut s Server) start_skillec(port) {
	mut server := net.listen_tcp(.ip6, ':$port') or { panic("[x] Error, Unable to bind server. Port is being used!") }
	for {
		mut socket := server.accept() or { panic("[x] Error, Unable to accept the incoming connection!") }
		socket.set_read_timeout(time.infinite)
		go s.connection_handler(mut socket)
	}
}

pub fn (mut s Server) connection_handler(mut socket et.TcpConn, mut c server.Clients) {
	mut user_ip = socket.peer_addr() or { "" }
}

/*
	Struct User Lookup Functions
*/

pub fn (mut c Clients) get_ip(username string) string {
	for i in 0..(c.sockets) {
		if c.users == username {
			return c.sockets.peer_addr() or { "[x] Failed to get Client's IP Address!" }
		}
	}
}
