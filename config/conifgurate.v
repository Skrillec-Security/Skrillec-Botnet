module config

import os
import utils

pub fn get_net_info() []string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	mut info := []string
	net_title := utils.parse(file_d, "Net_Info", "net_title")
	net_description := utils.parse(file_d, "Net_Info", "net_description")
	net_versoin := utils.parse(file_d, "Net_Info", "net_versoin")
	net_port := utils.parse(file_d, "Net_Info", "net_port")
	skrillec_key := utils.parse(file_d, "Net_Info", "skrillec_key")
	
	info << net_title
	info << net_description
	info << net_versoin
	info << net_port
	info << skrillec_key

	return info
}

pub fn get_db_info() []string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	host := utils.parse(file_d, "MySQL", "host")
	mut port := utils.parse(file_d, "MySQL", "port")
	username := utils.parse(file_d, "MySQL", "username")
	dbname := utils.parse(file_d, "MySQL", "dbname")

	mut reply := []string
	reply << host
	reply << port
	reply << username
	reply << dbname

	return reply
}

pub fn config_net_info() {

}
