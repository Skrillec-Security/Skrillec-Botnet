module server

import os
import io
import net
import server
import skrillec_cp

pub struct Current{
	pub mut:	
		fullcmd		string
		cmd			string
		cmd_args	[]string
}

pub fn (mut c Current) handle_cmd(data string) {
	c.fullcmd = data
	if data.contains(" ") {
		c.cmd_args = data.split(" ")
		c.cmd = c.cmd_args[1][1..]
	} else {
		c.cmd_args = data.split(" ")
		c.cmd = data
	}
}

pub fn cmd_handler(mut socket net.TcpConn, mut server server.Server) {
	mut reader := io.new_buffered_reader(reader: socket)

	for {
		mut data := reader.read_line() or { "" }
		if data.len > 0 {
			// Parse command here with a match statement
			match c.cmd {
			"cls" {
             println("TEST CLEAR")
			}
			"attack" {
             println("TEST STRESS")
			}
			"help" {
             println("TEST HELP")
			}
			"methods" {
             println("TEST METHODS")
			}
			"passwd" {
             println("TEST PASSWD")
			}
			}
		}
	}
	println(data)
}