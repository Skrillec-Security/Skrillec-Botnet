module config

import os
import utils

pub fn get_net_info() []string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	e_code, host := utils.parse(file_d, "MySQL", "host")
	_, port := utils.parse(file_d, "MySQL", "port")
	_, username := utils.parse(file_d, "MySQL", "username")
	_, password := utils.parse(file_d, "MySQL", "password")
	_, dbname := utils.parse(file_d, "MySQL", "dbname")

	mut reply := []string
	reply << port
	reply << username
	reply << password
	reply << dbname

	return reply
}

pub fn get_db_info() []string {
	//detect for 'localfiles' structure or 'MySQL' structure in the config file
	return ["", ""]
}
