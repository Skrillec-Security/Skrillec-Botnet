module skrillec_cp

import os
import net
import server

pub fn main_cp(mut svr server.Server) {
	for {
		mut input_cmd := os.input(">>> ")
		mut input_args := []string
		if input_cmd.contains(" ") { input_args = input_cmd.split(" ") }

		if input_cmd == "onlines" {
			println("Online Users")
			for i, username in svr.clients.u_name {
				println("${i} | ${username} | ${svr.clients.u_ip[i]}")
			}
		} else if input_cmd.starts_with("boardcast") {
			if input_args < 2 {
				full_msg := input_cmd.replace("${input_args} ", "")
				for i in svr.clients.u_sockets {
					i.write_string(full_msg) or { 0 }
				}
				println("Message sent to all users")
			}
		}
	}
}