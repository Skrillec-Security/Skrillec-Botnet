module config

import os
import utils

pub fn get_net_info() []string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	mut info := []string
	e_code, net_title := utils.parse(file_d, "Net_Info", "net_title")
	_, net_description := utils.parse(file_d, "Net_Info", "net_description")
	_, net_versoin := utils.parse(file_d, "Net_Info", "net_versoin")
	_, net_port := utils.parse(file_d, "Net_Info", "net_port")
	_, skrillec_key := utils.parse(file_d, "Net_Info", "skrillec_key")
	
	info << net_title
	info << net_description
	info << net_versoin
	info << net_port
	info << skrillec_key

	return info
}

pub fn get_db_info() []string {
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
