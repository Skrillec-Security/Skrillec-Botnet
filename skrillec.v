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

fn main() {
	mut svr := server.Server{clients: &server.Clients{}}
	
	// Command Parsing 
	mut cmd_args := os.args.clone()
	for i, v in cmd_args {
		if v == "-p" { svr.port = cmd_args[i+1] }

		if v == "reset_config" {
			if cmd_args[i+1] == "-MySQL" {
				//reset mysql info
			} else if cmd_args[i+1] == "-localdb" {

			} else if cmd_args[i+1] == "-net_info" {

			} else {
				// Execute function that'd reset the whole config file to default
			}
		}
	}
	if svr.port.len == 0 {
		print("[x] Warning. No port was provided. Looking through config file for port.........!")
		// Execute function to look for PORT in config file
	}
}