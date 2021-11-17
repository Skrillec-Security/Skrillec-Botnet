module server

import os
import io

pub struct Current{
	pub mut:	
		fullcmd		string
		cmd			string
		cmd_args	[]string
}

pub fn (mut c Current) handle_cmd(data string) {
	c.fullcmd = data
	if " " in data {
		c.cmd_args = data.split(" ")
		c.cmd = c.cmd_args[1][1..]
	} else {
		c.cmd_args = data
		c.cmd = data
	}
}

pub fn cmd_handler(mut socket net.TcpConn, mut server server.Server) {
	mut c = Current{}
	mut reader = io.new_buffered_reader(reader: socket)

	for {
		mut data := reader.read_line() or { "" }
		if data.len > 0 {
			c.handle_cmd(data)
		}
	}
}